
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying existing Data..."
ActiveStorage::Attachment.all.each(&:purge)
Booking.destroy_all
CoachingOffer.destroy_all
User.destroy_all

puts "Seeding coaches and offers"
5.times do |i|
  # Creating a new user/coach
  coach = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "email#{i}@gmail.com",
    profile_description: Faker::Lorem.sentence(word_count: 15),
    password: "123456"
  )
  # Adding profile_pic to user/coach
  file = File.open(Rails.root.join("app/assets/images/undraw_Female_avatar_re_l6cx.png"))
  coach.profile_pic.attach(io: file, filename: "profile_pic.png", content_type: "image/png")
  # Saving user/coach
  coach.save!
  puts "#{coach.first_name} #{coach.last_name} seeded"
  puts "Seeding 3 offers for #{coach.first_name} #{coach.last_name}"
  3.times do
    skill = ["Ruby", "Rails", "JavaScript", "HTML", "CSS", "FrontEnd", "BackEnd", "Python", "PHP"].sample
    offer = CoachingOffer.new(
      description: Faker::Lorem.sentence(word_count: 10),
      price: rand(50...100),
      skill: skill,
      user: coach,
      title: "Lost in #{skill}?",
      rating: rand(0..5)
    )
    offer.save!
    puts " -> #{offer.skill}-offer seeded"
  end
end
puts "5 coaches seeded!"
puts "15 offers seeded!"
