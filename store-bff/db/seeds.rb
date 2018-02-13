require 'securerandom'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

book_store = Seller.create(name: 'A Book Store')

book = Product.create(name: 'A simple book', price: 1500, image_url: 'http://imagerepo.com/book.jpg', seller: book_store)

mariana = User.create(name: 'Mariana', uid: SecureRandom.uuid)
_marianas_cart = Cart.create(user: mariana, products: [book])

