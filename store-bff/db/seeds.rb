require 'securerandom'

book_store = Seller.create(name: 'A Book Store')
game_store = Seller.create(name: 'A Game Store')
home_store = Seller.create(name: 'A Home Store')

book_a = Product.create(name: 'A book', price: 1500, image_url: 'http://imagerepo.com/book_a.jpg', seller: book_store)
book_b = Product.create(name: 'A simple book', price: 1000, image_url: 'http://imagerepo.com/book_b.jpg', seller: book_store)
book_c = Product.create(name: 'A good book', price: 2500, image_url: 'http://imagerepo.com/book_c.jpg', seller: book_store)

game_a = Product.create(name: 'A game', price: 2500, image_url: 'http://imagerepo.com/game_a.jpg', seller: game_store)
game_b = Product.create(name: 'A good game', price: 3500, image_url: 'http://imagerepo.com/game_b.jpg', seller: game_store)
game_c = Product.create(name: 'An old game', price: 5500, image_url: 'http://imagerepo.com/game_c.jpg', seller: game_store)

lamp_a = Product.create(name: 'A lamp', price: 500, image_url: 'http://imagerepo.com/lamp_a.jpg', seller: home_store)
lamp_b = Product.create(name: 'A blue lamp', price: 1500, image_url: 'http://imagerepo.com/lamp_b.jpg', seller: home_store)
lamp_c = Product.create(name: 'A green lamp', price: 1000, image_url: 'http://imagerepo.com/lamp_c.jpg', seller: home_store)

mariana = User.create(name: 'Mariana', uid: SecureRandom.uuid)
marianas_cart = Cart.create(user: mariana, products: [book_a, book_b, game_a, lamp_a])
mariana.update_attribute(:cart_id, marianas_cart.id)

sara = User.create(name: 'Sara', uid: SecureRandom.uuid)
saras_cart = Cart.create(user: sara, products: [book_c, book_a, game_c, lamp_c])
sara.update_attribute(:cart_id, saras_cart.id)

hugo = User.create(name: 'Hugo', uid: SecureRandom.uuid)
hugos_cart = Cart.create(user: hugo, products: [book_b, game_b, lamp_b])
hugo.update_attribute(:cart_id, hugos_cart.id)

_hugos_checkout = Checkout.create(cart: hugos_cart)

