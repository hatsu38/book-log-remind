class Book < ApplicationRecord
  belongs_to :author

  has_many :account_books
  has_many :accounts, through: :account_books

  validates :title, :code, presence: true
end
