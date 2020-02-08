# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'faker'
# puts "Destroy users"
# User.destroy_all if Rails.env.development?
address = ["Marylebone Rd, Marylebone, London NW1 5LR", "Buckingham Palace Westminster London SW1E 6LA", "10 Downing St, Westminster, London SW1A 2AA", " The Queen's Walk, Bishop's, London SE1 7PB", "184 Camden High St, Camden Town, London NW1 8QP"]
user_photos = ['https://res.cloudinary.com/ddhmqwylk/image/upload/v1581176970/nicolas-horn-MTZTGvDsHFY-unsplash_xpfqge.jpg',
  'https://res.cloudinary.com/ddhmqwylk/image/upload/v1581176969/ben-parker-NohB3FJSY90-unsplash_bgq5zz.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/v1581176969/ben-parker-OhKElOkQ3RE-unsplash_cbbhi5.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/v1581176968/luis-villasmil-6qf1uljGpU4-unsplash_xvyzar.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/v1581177724/sarah-brown-tTdC88_6a_I-unsplash_wkvvpl.jpg']
user_filenames = ['nicolas-horn-MTZTGvDsHFY-unsplash_xpfqge.jpg', 'ben-parker-NohB3FJSY90-unsplash_bgq5zz.jpg', 'ben-parker-OhKElOkQ3RE-unsplash_cbbhi5.jpg', 'luis-villasmil-6qf1uljGpU4-unsplash_xvyzar.jpg', 'sarah-brown-tTdC88_6a_I-unsplash_wkvvpl.jpg']
flat_photos =
['https://res.cloudinary.com/ddhmqwylk/image/upload/v1581176970/fabio-hanashiro-yp4qpKCUdIE-unsplash_ij228s.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/v1581176969/andrea-davis-FAAdj9neOb8-unsplash_hrbsrt.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/v1581176970/shan-li-fang-ycAzNfHtcWk-unsplash_z7kdru.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/v1581176969/andrea-davis-7iUW5k1ppyA-unsplash_jq7kiy.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/v1581176968/scott-webb-1ddol8rgUH8-unsplash_pfimrm.jpg']
flat_filenames = ['fabio-hanashiro-yp4qpKCUdIE-unsplash_ij228s.jpg', 'andrea-davis-FAAdj9neOb8-unsplash_hrbsrt.jpg',
 'shan-li-fang-ycAzNfHtcWk-unsplash_z7kdru.jpg', 'andrea-davis-7iUW5k1ppyA-unsplash_jq7kiy.jpg', 'scott-webb-1ddol8rgUH8-unsplash_pfimrm.jpg']
Booking.destroy_all
Flat.destroy_all
User.destroy_all
puts 'creating 5 users and flats'

5.times do
  counter = 0
  user = User.create!(email: Faker::Internet.email, password: '123456')
  flat = Flat.new(address: "#{address[counter]}", description: Faker::Movies::StarWars.quote, title: Faker::Address.street_address, user_id: user.id, beds: Faker::Number.within(range: 1..6), bedrooms: Faker::Number.within(range: 1..10), guests: Faker::Number.within(range: 1..10), price_per_night:Faker::Number.within(range: 50..100) )
  flat.save
  counter += 1
end



