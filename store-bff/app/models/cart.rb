class Cart < ApplicationRecord
  belongs_to :user
  has_many :products_to_cart
  has_many :products, through: :products_to_cart
  has_one :checkout

  def total_price
    products.inject(0) do |total, product|
      total += product.price
    end
  end
end
