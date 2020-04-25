class AddReviewTextToAccountBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :account_books, :review_text, :text
  end
end
