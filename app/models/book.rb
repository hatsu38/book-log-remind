class Book < ApplicationRecord
  belongs_to :author

  has_many :users, through: :user_books
  has_many :user_books
end
