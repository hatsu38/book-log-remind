class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts, comment: 'アカウント' do |t|
      t.string :name, null: false, comment: 'アカウントの名前'
      t.string :code_name, null: false, unique: true, comment: 'アカウントのコードネーム'

      t.timestamps
    end
  end
end
