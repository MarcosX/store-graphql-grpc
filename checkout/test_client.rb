#!/usr/bin/env ruby

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'protos/checkout_services_pb'

stub = Store::Checkout::Stub.new('localhost:50051', :this_channel_is_insecure)
checkout_request = Store::CheckoutRequest.new(
  user_uid: 123456,
  cart_total: 1000)
checkout_request.product_id += [1,2,3]
checkout_response = stub.process_payment(checkout_request)
puts """Checkout status: #{checkout_response.status}
      Cart Total: #{checkout_response.cart_total}
      Discounts: #{checkout_response.discount_total}
      Paid amount: #{checkout_response.paid_amount}"""
