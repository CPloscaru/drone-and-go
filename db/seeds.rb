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
User.create!(email: "jeremyt@gmail.com", password: "123456", name: "Jeremy", last_name:"Thomas")
User.create!(email: "calinp@gmail.com", password: "123456", name: "Calin", last_name:"Ploscaru")
puts "Users created"

puts "Create 10 drones..."
11.times do |_|
  drone = Drone.new(
    name: Faker::Drone.name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price_per_day: rand(30..125),
    flight_time: Faker::Drone.flight_time,
    max_altitude: Faker::Drone.max_altitude,
    max_wind_resistance: Faker::Drone.max_wind_resistance,
    max_resolution: Faker::Drone.max_resolution,
    max_flight_distance:Faker::Drone.max_flight_distance
  )
  drone.owner = User.all.sample
  drone.save
end

puts "Created #{Drone.all.count} drones finished"

puts "Created a drone for last user named : '#{User.last.name}'"
drone = Drone.new(
  name: Faker::Drone.name,
  description: Faker::Lorem.paragraph(sentence_count: 3),
  price_per_day: rand(30..125),
  flight_time: Faker::Drone.flight_time,
  max_altitude: Faker::Drone.max_altitude,
  max_wind_resistance: Faker::Drone.max_wind_resistance,
  max_resolution: Faker::Drone.max_resolution,
  max_flight_distance:Faker::Drone.max_flight_distance
)

drone.owner = User.last
drone.save

puts "Created 10 booking for last user named : '#{User.last.name}'"
10.times do |_|
  puts "Created a new booking"
  month = rand(4..12)
  day = rand(1..25)
  booking = Booking.new(starting_date: "2025/#{month}/#{day}",
              ending_date: "2025/#{month}/#{day+4}",
              total_price: 4*rand(35..55))

  booking.customer = User.last
  booking.drone = Drone.all.sample
  booking.save
end

puts "Created a new booking with customer same as owner"
booking = Booking.new(starting_date: "2025/03/21",
            ending_date: "2025/03/25",
            total_price: 255)

booking.customer = User.find(Drone.last.owner_id)
booking.drone = Drone.last

puts "Seed finished"
