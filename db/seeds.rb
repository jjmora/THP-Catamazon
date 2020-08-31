# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Item.destroy_all
User.destroy_all
Cart.destroy_all

10.times do |x|
  user = User.create!(
    email: Faker::Internet.email,
    password:"azerty",
    password_confirmation:"azerty"
  )
end

10.times do |x|
  x+=1
  cart = Cart.create!(
    user_id: User.find(User.first.id).id + x-1
  )
end

20.times do |x|
  item = Item.create(
    title: Faker::Creature::Cat.name,
    description: Faker::Creature::Cat.breed,
    price: Faker::Number.decimal(l_digits: 2),
    image_url: Faker::Creature::Cat.breed
  )
end

30.times do |x|
  list = ListItem.create!(
    cart_id: Cart.find(rand(Cart.first.id..Cart.last.id)).id,
    item_id: Item.find(rand(Item.first.id..Item.last.id)).id
  )
end

puts 'Seed done !'