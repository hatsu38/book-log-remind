namespace :scrape_account do
  desc 'アカウントのスクレイピングと本の登録'
  task scrape_and_book_registe: :environment do
    accounts = Account.all.order(id: 'DESC').limit(100)
    accounts.each do |account|
      api_url = "https://api.booklog.jp/json/#{account.code_name}?count=100"
      response = get_response_body(api_url)
      next if response == ''

      books = get_books(response)
      books.each do |book|
        author = Author.find_or_create_by(name: book['author'])
        author_id = author.presence || nil
        create_book(book, author_id)
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

def create_book(book, author_id)
  Book.find_or_create_by(
    title: book['title'],
    code: book['asin'],
    image_url: book['image'],
    author: author_id
  )
end