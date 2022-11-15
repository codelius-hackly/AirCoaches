# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying existing Data..."
Booking.destroy_all
CoachingOffer.destroy_all
User.destroy_all

puts "Seeding coaches and offers"
5.times do |i|
  coach = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "email#{i}@gmail.com",
    profile_description: Faker::Lorem.sentence(word_count: 15),
    password: "123456"
  )
  coach.save!
  puts "#{coach.first_name} #{coach.last_name} seeded"
  3.times do
    offer = CoachingOffer.new(
      description: Faker::Lorem.sentence(word_count: 10),
      price: rand(50...100),
      skill: ["Ruby", "Rails", "JavaScript", "HTML/CSS", "FrontEnd", "BackEnd"].sample,
      user: coach
    )
    offer.save!
    puts " -> #{offer.skill}-offer seeded"
  end
end
puts "5 coaches seeded!"
puts "15 offers seeded!"
