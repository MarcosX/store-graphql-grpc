class User < ApplicationRecord
  has_one :cart
  has_many :products, through: :cart

  def cart
    Cart.where(user_id: id).last
  end
end
