class CreateCartedProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :carted_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.integer :price_at_purchase

      t.timestamps
    end
  end
end
