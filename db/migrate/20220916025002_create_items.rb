class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: true
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.boolean :item_status, null: false, deault: false
      t.integer :amount, nill: true
      t.timestamps
    end
  end
end
