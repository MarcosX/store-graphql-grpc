Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'A user who buys products'

  field :id, !types.Int
  field :name, !types.String
  field :uuid, !types.String
  field :cart, Types::CartType
end
