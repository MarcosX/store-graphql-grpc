# Starting the server

Just execute `bundle exec ruby server.rb` and the server will start listening on port
50051 for calls to the checkout service.

# Project structure

`server.rb` contains the code to start the checkout server, which is defined at
`lib/checkout_service.rb` and loads generated code from `.proto` files.

`test_client.rb` is a simple client that publishes a dummy message to the server and
prints the response.

# Compiling .proto

To generate ruby code from proto files run
[namely/protoc-all](https://github.com/namely/docker-protoc) docker image:

```
docker run -v `pwd`:/defs namely/protoc-all -f protos/checkout.proto -l ruby -o lib
```

This will put the generated files inside `lib/protos` and then `server.rb` will load
them when starting the server, making it ready to receive connections.

