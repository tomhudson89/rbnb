# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# puts "Destroy users"
# User.destroy_all if Rails.env.development?
Flat.destroy_all
User.destroy_all
puts 'creating 10 users and flats'
10.times do
  user = User.create!(email: Faker::Internet.email, password: '123456')
  flat = Flat.new(address: Faker::Address.full_address, description: Faker::Movies::StarWars.quote, title: Faker::Address.street_address, user_id: user.id, beds: Faker::Number.within(range: 1..6), bedrooms: Faker::Number.within(range: 1..10), guests: Faker::Number.within(range: 1..10), price_per_night:Faker::Number.within(range: 50..100)  )
  flat.save
end



