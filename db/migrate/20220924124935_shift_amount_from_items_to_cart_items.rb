class ShiftAmountFromItemsToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :amount, :integer, null: false
    remove_column :items, :amount, :integer
  end
end
