namespace :scrape_account do
  desc 'アカウントのスクレイピングと本の登録'
  task scrape_and_book_registe: :environment do
    accounts = Account.all.order(id: 'DESC').limit(100)
    BOOKLOG_API= 'https://api.booklog.jp/json/'
    BOOKLOG_API_COUNT = 100
    NON_REVIEW_TEXT = "まだレビューは書かれていません。"
    agent = Mechanize.new
    accounts.each do |account|
      api_url = "#{BOOKLOG_API}#{account.code_name}?count=#{BOOKLOG_API_COUNT}"
      response = get_response_body(api_url)
      next if response == ''

      books = get_books(response)
      books.each do |book|
        author = book['author'].present? ? Author.find_or_create_by(name: book['author']) : nil
        book=account.registe_self_book(book, author)
        next if book.code.empty?

        review = review_text_get(agent, account, book)
        next if review.nil?

        account_book = AccountBook.find_or_initialize_by(account_id: account.id, book_id: book.id)
        account_book.update(review_text: review)
      end
    end
  end
end

def get_response_body(api_url)
  url = URI.parse(api_url)
  response = Net::HTTP.get_response(url)
  response.body.presence || ''
end

def get_books(json)
  paresed = JSON.parse(json)
  paresed['books'].reverse
end

def review_text_get(agent, account, book)
  begin
    url = "https://booklog.jp/users/#{account.code_name}/archives/1/#{book.code}"
    page = agent.get(url)
    review = page.search('p.review-txt.t20M')
    return nil if review.empty?

    judge_review_written?(review) ? review.text.strip : nil
  rescue Mechanize::ResponseCodeError => e
    Rails.logger.error("====口コミの取得に失敗====")
    Rails.logger.error(e.message)
    Rails.logger.error(e.response_code)
    Rails.logger.error(account)
    Rails.logger.error(book)
    Raven.capture_exception(e)
  end
end

def judge_review_written?(review)
  review.text.strip != NON_REVIEW_TEXT
end