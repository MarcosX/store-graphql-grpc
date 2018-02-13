class Cart < ApplicationRecord
  belongs_to :user
  has_many :products_to_cart
  has_many :products, through: :products_to_cart
end
