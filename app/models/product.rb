class Product < ApplicationRecord
  belongs_to :category
  has_many :carted_products
end
