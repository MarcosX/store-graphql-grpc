Types::SellerType = GraphQL::ObjectType.define do
  name 'Seller'
  description 'A seller who sells products'

  field :id, !types.Int
  field :name, !types.String
  field :products, types[Types::ProductType]
end
