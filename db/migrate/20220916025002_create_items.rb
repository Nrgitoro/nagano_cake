class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: true
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.boolean :item_status, null: false, deault: false


      t.timestamps
    end
  end
end
