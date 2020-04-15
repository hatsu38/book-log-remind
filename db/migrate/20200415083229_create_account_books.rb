class CreateAccountBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :account_books, comment: 'アカウントと本の中間テーブル' do |t|
      t.references :account, null: false, foreign_key: true, comment: 'アカウントID'
      t.references :book, null: false, foreign_key: true, comment: '本ID'

      t.timestamps
    end
  end
end
