# Setup

Install ruby and rails, then run

```
bundle # install all gems
bundle exec rails db:create db:migrate db:seed # setup the SQLite database
bundle exec rails server # start the server
```

# Accessing with httpie

Install [httpie](https://httpie.org) and run the following:

`http -v POST localhost:3000/graphql query="query { products(name: \"book\") { name, price} } "`

# Accessing with GraphiQL App

Point [GraphiQL App](https://github.com/skevy/graphiql-app) to `http://localhots:3000/graphql`.

# Sample queries:

```
mutation AddProductToCart {
  add_to_cart(product_id: 1, user_id: 1) {
    user {
      name
      cart {
        total_price
      }
    }
    products {
      id
    }
  }
}

mutation DoCheckout {
  do_checkout(user_id: 1) {
    id
    cart {
      id
      user {
        name
      }
      products {
        id
      }
    }
  }
}

query GetCheckout {
  checkout(cart_id: 1) {
    id
    cart {
      products {
        name
        price
      }
      user {
        name
        cart {
          total_price
        }
      }
    }
  }
}

query GetProducts {
  products(name: "good") {
    name
    price
    id
    seller {
      name
      products {
        name
        id
      }
    }
  }
}

query GetUser {
  user(name: "Mariana") {
    id
    name
    cart {
      id
      products {
        name
        price
        seller {
          name
        }
      }
    }
  }
}
```
