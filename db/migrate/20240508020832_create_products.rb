class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image_url
      t.string :availability

      t.timestamps
    end
  end
end
