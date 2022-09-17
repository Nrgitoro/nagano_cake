class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      
      t.string :name_first, null: false
      t.string :name_second, null: false
      t.string :name_firdt_rubi, null: false
      t.string :name_second_rubi, null: false
      t.string :address, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :tel, null: false
      t.string :post_code, null: false

      t.timestamps
    end
  end
end
