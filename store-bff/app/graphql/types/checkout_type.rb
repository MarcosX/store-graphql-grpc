Types::CheckoutType = GraphQL::ObjectType.define do
  name 'Checkout'
  description 'A cart checkout'

  field :id, types.Int
  field :cart, Types::CartType
end
