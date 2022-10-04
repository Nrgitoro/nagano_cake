class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: {
    waiting: 0,
    paid_up: 1,
    preparing: 2,
    shipped: 3
}

  belongs_to :customer
  has_many :order_details
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
