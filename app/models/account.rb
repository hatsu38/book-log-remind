class Account < ApplicationRecord
  has_many :account_books
  has_many :books, through: :account_books

  validates :name, :code_name, presence: true

  def registe_self_book(scrape_book, author)
    books.find_or_create_by(
      title: scrape_book['title'],
      code: scrape_book['asin'],
      image_url: scrape_book['image'],
      author: author
    )
  end
end
