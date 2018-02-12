Types::ProductType = GraphQL::ObjectType.define do
  name 'Product'
  description 'A product'

  field :name, !types.String
  field :price, !types.Int
  field :image_url, types.String
  field :seller do
    type Types::SellerType
    resolve -> (product, args, _ctx) { product.seller }
  end
end
