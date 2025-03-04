# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

puts "Create 4 users (Yann, David, Jeremy, Calin)"
User.create!(email: "davidb@gmail.com", password: "123456", name: "David", last_name:"Bellot")
User.create!(email: "yannb@gmail.com", password: "123456", name: "Yann", last_name:"Boiteau")
User.create!(email: "calinp@gmail.com", password: "123456", name: "Calin", last_name:"Ploscaru")
User.create!(email: "jeremyt@gmail.com", password: "123456", name: "Jeremy", last_name:"Thomas")
puts "Users created"

puts "Create 10 drones..."
10.times do |_|
  drone = Drone.new(
    name: Faker::Fantasy::Tolkien.character,
    category: Drone::CATEGORIES.sample,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price_per_day: rand(30..125),
    price_for_lease: rand(300..500),
    autonomy_rating: rand(0.1..5.0).round(2),
    stability_rating: rand(0.1..5.0).round(2),
    camera_quality_rating: rand(0.1..5.0).round(2),
    range_rating: rand(0.1..5.0).round(2)
  )
  drone.owner = User.all.sample
  drone.save
end

puts "Created #{Drone.all.count} drones finished"

puts "Created an AC-130 drone"
drone = Drone.new(name: "AC-130",
            category: "Type 1",
            description: Faker::Lorem.paragraph(sentence_count: 3),
            price_per_day: 35.0,
            price_for_lease: 300.0,
            autonomy_rating:3,
            stability_rating: 4,
            camera_quality_rating: 2,
            range_rating: 5)

drone.owner = User.all.last
drone.save

puts "Created a new booking"

booking = Booking.new(starting_date: "2025/03/21",
            ending_date: "2025/03/25",
            total_price: 4*35.0)

booking.customer = User.first
booking.drone = Drone.last

booking.save

puts "Seed finished"
