class RemoveProductIdFromCarts < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :product_id, :bigint
    remove_column :carts, :product_name, :string
    remove_column :carts, :price, :decimal
    remove_column :carts, :total, :decimal
  end
end
