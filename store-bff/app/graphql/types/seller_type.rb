Types::SellerType = GraphQL::ObjectType.define do
  name 'Seller'
  description 'A seller who sells products'

  field :name, !types.String
  field :products, types[Types::ProductType]
end
