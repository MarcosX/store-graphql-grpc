Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :products do
    type types[Types::ProductType]
    description 'Search for a product by name'
    argument :name, !types.String
    resolve -> (root, args, ctx) do
      Product.where('lower(name) like ?', "%#{args[:name]}%")
    end
  end
end
