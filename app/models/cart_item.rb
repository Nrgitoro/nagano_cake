class CartItem < ApplicationRecord
  has_one_attached :item_image
  belongs_to :item
  belongs_to :customer
end
