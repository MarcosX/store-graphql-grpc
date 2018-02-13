Types::CartType = GraphQL::ObjectType.define do
  name 'Cart'
  description 'A cart with products for a user'

  field :products, types[Types::ProductType]
  field :user, Types::UserType
  field :total_price do
    type types.Int
    resolve -> (cart, args, _ctx) do
      cart.total_price
    end
  end
end

