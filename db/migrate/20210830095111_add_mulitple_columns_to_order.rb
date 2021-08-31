class AddMulitpleColumnsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :cart_item_id, :integer
    add_column :orders, :product_id, :integer
    add_column :orders, :total, :decimal
    add_column :orders, :quantity, :integer
  end
end
