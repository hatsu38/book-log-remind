class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors, comment: '著者' do |t|
      t.string :name, null: false, comment: '著者名'

      t.timestamps
    end
  end
end
