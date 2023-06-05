# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "Deleating Database...."

puts "Creating Database...."

test_user = User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
)
20.times do
  Spaceship.create!(
    name: Faker::Space.nasa_space_craft,
    category: ["Small", "Medium", "Large"].sample,
    location: Faker::Address.full_address,
    price: rand(1_000_000.50..5_000_000.75).round(2),
    user: test_user
  )
end
puts "Database Created! z0/"
