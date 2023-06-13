class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  belongs_to :item
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum address_select: { own_address: 0, registered_address: 1, new_address: 2 }
  
end
