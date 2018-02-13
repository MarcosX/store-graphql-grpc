Types::CartType = GraphQL::ObjectType.define do
  name 'Cart'
  description 'A cart with products for a user'

  field :products, types[Types::ProductType]
end

