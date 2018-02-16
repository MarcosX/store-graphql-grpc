require 'protos/checkout_services_pb'

class CheckoutServer < Store::Checkout::Service

  def process_payment(checkout_request, _unused_call)
    puts build_request_log(checkout_request)
    discount_amount = 100
    paid_amount = checkout_request.cart_total - discount_amount
    Store::CheckoutResponse.new(
      cart_total: checkout_request.cart_total,
      discount_total: discount_amount,
      paid_amount: paid_amount,
      status: Store::CheckoutStatus::SUCCESSFUL
    )
  end

  private
  def build_request_log(checkout_request)
    "-----------------------------
    Received Checkout request
    Products: #{checkout_request.product_id}
    User uid: #{checkout_request.user_uid}
    Cart total: #{checkout_request.cart_total}"
  end

end

