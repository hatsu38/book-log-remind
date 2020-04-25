class Account < ApplicationRecord
  has_many :account_books
  has_many :books, through: :account_books

  validates :name, :code_name, presence: true
end
