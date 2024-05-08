class User < ApplicationRecord
  has_one :carted_products
  has_many :orders
end
