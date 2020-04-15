class CreateUserBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_books, comment: 'ユーザーと本の中間テーブル' do |t|
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーID'
      t.references :book, null: false, foreign_key: true, comment: '本ID'

      t.timestamps
    end
  end
end
