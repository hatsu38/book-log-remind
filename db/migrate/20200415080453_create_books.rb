class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books, comment: '本' do |t|
      t.string :title, null: false, comment: 'タイトル'
      t.integer :asin, comment: 'ASINコード'
      t.string :code, null: false, unique: true, comment: '本コード(ASINがあるとは限らないため)'
      t.string :image_url, comment: '画像URL'
      t.references :author, null: false, foreign_key: true, comment: '著者ID'

      t.timestamps
    end
  end
end
