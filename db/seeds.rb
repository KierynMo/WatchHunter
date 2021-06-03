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



20.times do
  @user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456')
  watch = Watch.create!(name: Faker::Superhero.name, brand: Faker::Company.name, price: rand(2...100), user: @user)
  file = URI.open('https://loremflickr.com/320/240/watch')
  watch.photo.attach(io: file, filename: "watch#{filename_iterator}.png", content_type: 'image/png')
  filename_iterator += 1
end

