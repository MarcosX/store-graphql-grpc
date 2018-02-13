Types::CheckoutType = GraphQL::ObjectType.define do
  name 'Checkout'
  description 'A cart checkout'

  field :total_price do
    type types.Int
    resolve -> (checkout, args, _ctx) do
      checkout.cart.total_price
    end
  end

  field :products, types[Types::ProductType]
  field :user, Types::UserType
end
