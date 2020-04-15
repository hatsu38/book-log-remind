class Account < ApplicationRecord
  has_many :books, through: :account_books
  has_many :account_books

  validates :name, :code_name, presence: true
  validates :email, uniqueness: true
end
