Types::CheckoutType = GraphQL::ObjectType.define do
  name 'Checkout'
  description 'A cart checkout'

  field :total_price do
    type types.Int
    resolve -> (checkout, args, _ctx) do
      checkout.products.inject(0) do |total, product|
        total += product.price
      end
    end
  end

  field :products, Types::ProductType
  field :user, Types::UserType
end
