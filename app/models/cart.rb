class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :carted_products
end
