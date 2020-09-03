# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# for fake seeds
require 'faker'
# for urls
require 'uri'

# destroying old columns from tables
# Item.destroy_all
User.destroy_all
Cart.destroy_all
ListItem.destroy_all
Order.destroy_all
x=1

#seeding
puts 'Seed begins'
# begin seeding
puts 'creating Users'
# don t put long urls and long names for files
1.times do |x|
  user = User.create!(
    email: "user@user.com",
    password:"azerty",
    password_confirmation:"azerty",
    is_admin: false
  )
end

puts 'simple user created : user@user.com | azerty'

User.create(
  email: "admin@admin.com",
  password:"azerty",
  password_confirmation:"azerty",
  is_admin: true
)
 
puts 'admin user created : admin@admin.com | azerty'

puts 'creating 8 items' # was 10 but 8 is better for light use on s3

# 8.times.with_index do |x, index|
#   item = Item.create(
#     title: Faker::Creature::Cat.name,
#     description: Faker::Creature::Cat.breed,
#     price: Faker::Number.decimal(l_digits: 2),
#     image_url: Faker::Creature::Cat.breed
#   )
#   item.image.attach(io: File.open("app/assets/images/#{index+1}.jpg"), filename: "#{index+1}.jpg")
# end


Item.all.each do |item|
  x+=1
  item.slug = "cat-#{x-1}"
  item.save
end

puts '20 items were created'

15.times do |x|
  list = ListItem.create!(
    cart_id: Cart.find(rand(Cart.first.id..Cart.last.id)).id,
    item_id: Item.find(rand(Item.first.id..Item.last.id)).id
  )
end

puts 'items were added to the list'
# end of seed : are you here ?
puts 'Seed done !' 