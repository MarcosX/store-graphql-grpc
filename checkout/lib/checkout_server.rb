require 'protos/checkout_services_pb'

class CheckoutServer < Store::Checkout::Service

  def process_payment(checkout_request, _unused_call)
    puts checkout_request
    discount_amount = 100
    paid_amount = checkout_request.cart_total - discount_amount
    Store::CheckoutResponse.new(
      cart_total: checkout_request.cart_total,
      discount_total: discount_amount,
      paid_amount: paid_amount,
      status: Store::CheckoutStatus::SUCCESSFUL
    )
  end

end

