class RemoveColumnsFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :product_id, :integer
    remove_column :orders, :total, :decimal
    remove_column :orders, :quantity, :integer
    remove_column :orders, :cart_item_id, :integer
  end
end
