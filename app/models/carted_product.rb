class CartedProduct < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :oder, optional: true
  belongs_to :product

end
