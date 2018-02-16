#!/usr/bin/env ruby

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'checkout_server'

grpc_server = GRPC::RpcServer.new
grpc_server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
grpc_server.handle(CheckoutServer)
grpc_server.run_till_terminated
