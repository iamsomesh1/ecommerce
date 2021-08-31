class RemoveColumnFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :cart_id, :bigint
    remove_column :orders, :cart_item_id, :string
  end
end
