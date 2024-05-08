class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :order_id
      t.integer :payment_method_id
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
