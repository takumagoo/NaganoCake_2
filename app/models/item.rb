class Item < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :genres, dependent: :destroy
  
end
