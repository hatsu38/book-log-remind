class accountBook < ApplicationRecord
  belongs_to :account
  belongs_to :book
end
