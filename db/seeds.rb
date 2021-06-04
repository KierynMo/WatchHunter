# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

filename_iterator = 1

TWENTY_LONDON_POSTCODES = ['HA0 1BZ', 'W4 4BZ', 'SW15 4EE', 'SW12 8SR', 'SW2 5TN', 'SE5 8BN', 'SE15 5JA', 'E16 3DH', 'E15 4JY', 'E10 7HF', 'N15 5DS', 'N19 3NU', 'NW3 3EU', 'Nw10 3HJ', 'NW10 8UR', 'NW10 7EF', 'W6 7PZ', 'W14 0RN', 'SW3 6QR', 'SW11 4EJ']

@first_user = User.create!(first_name: "Doug", last_name: "Barr", email: "doug@gmail.com", password: '123456')
doug = URI.open('https://loremflickr.com/320/240/kilt')
@first_user.photo.attach(io: doug, filename: "doug.png", content_type: 'image/png')


20.times do
  @user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456')
  photo_file = URI.open('https://loremflickr.com/320/240/smiling')
  @user.photo.attach(io: photo_file, filename: "user#{filename_iterator}.png", content_type: 'image/png')
  watch = Watch.create!(name: Faker::Superhero.name, brand: Faker::Company.name, price: rand(2...100), user: @user, postcode: TWENTY_LONDON_POSTCODES[filename_iterator - 1])
  file = URI.open('http://loremflickr.com/320/240/wrist,watch,rolex/all')
  watch.photo.attach(io: file, filename: "watch#{filename_iterator}.png", content_type: 'image/png')
  filename_iterator += 1
end


