class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, comment: 'ユーザー' do |t|
      t.string :name, null: false, comment: 'ユーザーの名前'
      t.string :code_name, null: false, unique: true, comment: 'ユーザーのコードネーム'

      t.timestamps
    end
  end
end
