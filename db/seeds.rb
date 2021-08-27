require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating new Users...'

30.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save
end

puts 'Creating Teachers...'

20.times do
  teacher = Teacher.new(
    user_id: rand(1..30),
    description: Faker::Lorem.sentence,
    price: rand(100..20000),
    category: ["Front-End Specialist", "Back-End Specialist", "Full Stack Specialist"].sample
  )
  teacher.save
end

puts "Now you have #{User.count} users, #{Teacher.count} teachers in total."
