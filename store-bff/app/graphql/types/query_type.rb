Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :user do
    type Types::UserType
    description 'Search for a user by name'
    argument :name, !types.String
    resolve -> (root, args, ctx) do
      User.find_by(name: args[:name])
    end
  end

  field :products do
    type types[Types::ProductType]
    description 'Search for a product by name'
    argument :name, !types.String
    resolve -> (root, args, ctx) do
      Product.where('lower(name) like ?', "%#{args[:name]}%")
    end
  end
end
