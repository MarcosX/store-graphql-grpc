class Checkout < ApplicationRecord
  belongs_to :cart
  has_one :user, through: :cart
  has_many :products, through: :cart
end
