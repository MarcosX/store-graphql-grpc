require 'grpc'
require 'protos/checkout_services_pb'

class CheckoutClient

  def initialize(checkout)
    @checkout = checkout
    @stub = Store::Checkout::Stub.new('localhost:50051', :this_channel_is_insecure)
  end

  def process_payment
    checkout_request = Store::CheckoutRequest.new(
      user_uid: @checkout.user.id,
      cart_total: @checkout.cart.total_price
    )
    checkout_request.product_id += @checkout.cart.products.map(&:id)
    @stub.process_payment(checkout_request)
  end
end

