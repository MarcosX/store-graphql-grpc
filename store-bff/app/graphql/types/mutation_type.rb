Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  
  field :add_to_cart do
    type Types::CartType
    description 'Add a product to a users cart'
    argument :user_id, !types.Int
    argument :product_id, !types.Int
    resolve -> (root, args, _ctx) do
      user = User.find(args[:user_id])
      product = Product.find(args[:product_id])
      user.cart.products << product
      user.cart
    end
  end

  field :do_checkout do
    type Types::CheckoutType
    description 'Checkout a users cart'
    argument :user_id, !types.Int
    resolve -> (root, args, _ctx) do
      user = User.find(args[:user_id])
      checkout = Checkout.create(cart: user.cart)
      CheckoutClient.new(checkout).process_payment
      user.update_attribute(:cart_id, Cart.create(user: user).id)
      checkout
    end
  end
end
