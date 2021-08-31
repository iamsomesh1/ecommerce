class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :product_name
      t.decimal :price
      t.decimal :total
      t.bigint :user_id

      t.timestamps
    end
  end
end
