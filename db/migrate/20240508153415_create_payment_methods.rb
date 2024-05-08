class CreatePaymentMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_methods do |t|
      t.integer :user_id
      t.string :card_number
      t.string :expiration_date
      t.string :cvv

      t.timestamps
    end
  end
end
