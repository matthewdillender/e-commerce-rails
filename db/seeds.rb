# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Seed categories
categories = Category.create([
  { name: 'Bowls', description: 'Various types of bowls' },
  { name: 'Plates', description: 'Different styles of vases' },
  { name: 'Mugs', description: 'Unique mug designs' }
])

# Seed products
products = Product.create([
  { name: 'Ceramic Bowl 1', description: 'Handcrafted ceramic bowl', price: 20, image_url: 'example.com/bowl_image.jpg', availability: 'In stock', category_id: categories[0].id },
  { name: 'Ceramic Bowl 2', description: 'Another handcrafted ceramic bowl', price: 25, image_url: 'example.com/bowl_image.jpg', availability: 'In stock', category_id: categories[0].id },
  { name: 'Decorative Vase 1', description: 'Beautiful decorative vase', price: 30, image_url: 'example.com/vase_image.jpg', availability: 'In stock', category_id: categories[1].id },
  { name: 'Decorative Vase 2', description: 'Another beautiful decorative vase', price: 35, image_url: 'example.com/vase_image.jpg', availability: 'In stock', category_id: categories[1].id },
  { name: 'Patterned Mug 1', description: 'Colorful patterned mug', price: 15, image_url: 'example.com/mug_image.jpg', availability: 'In stock', category_id: categories[2].id },
  { name: 'Patterned Mug 2', description: 'Another colorful patterned mug', price: 18, image_url: 'example.com/mug_image.jpg', availability: 'In stock', category_id: categories[2].id },
  { name: 'Ceramic Plate 1', description: 'Handcrafted ceramic plate', price: 25, image_url: 'example.com/plate_image.jpg', availability: 'In stock', category_id: categories[0].id },
  { name: 'Ceramic Plate 2', description: 'Another handcrafted ceramic plate', price: 28, image_url: 'example.com/plate_image.jpg', availability: 'In stock', category_id: categories[0].id },
  { name: 'Decorative Pot 1', description: 'Small decorative pot', price: 10, image_url: 'example.com/pot_image.jpg', availability: 'In stock', category_id: categories[1].id },
  { name: 'Decorative Pot 2', description: 'Large decorative pot', price: 20, image_url: 'example.com/pot_image.jpg', availability: 'In stock', category_id: categories[1].id },
  { name: 'Patterned Bowl 1', description: 'Colorful patterned bowl', price: 22, image_url: 'example.com/bowl_image.jpg', availability: 'In stock', category_id: categories[2].id },
  { name: 'Patterned Bowl 2', description: 'Another colorful patterned bowl', price: 25, image_url: 'example.com/bowl_image.jpg', availability: 'In stock', category_id: categories[2].id }
])

# Seed users
users = User.create([
  { name: 'Amanda', email: 'amandajohn@etest.com', password: 'password', password_confirmation: 'password' },
  { name: 'Matt', email: 'matt@test.com', password: 'password', password_confirmation: 'password' }
])

# Seed carts (optional)
carts = Cart.create([
  { user_id: users[0].id, session_id: SecureRandom.hex(10) },
  { user_id: users[1].id, session_id: SecureRandom.hex(10) }
])

# Seed orders (optional)
orders = Order.create([
  { user_id: users[0].id, total_price: 50, status: 'completed' },
  { user_id: users[1].id, total_price: 45, status: 'completed' }
])

# Seed carted products (optional)
carted_products = CartedProduct.create([
  { order_id: orders[0].id, product_id: products[0].id, quantity: 2, price_at_purchase: products[0].price },
  { order_id: orders[1].id, product_id: products[1].id, quantity: 1, price_at_purchase: products[1].price }
])
