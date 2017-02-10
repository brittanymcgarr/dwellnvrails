# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example User",
             email: "example@dwellnv.com",
             primary_phone: "(555)555-5555",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@dwellnv.com"
  password = "password"
  phone = "(555)555-7777"
  User.create!(name:  name,
               email: email,
               primary_phone: phone,
               password:              password,
               password_confirmation: password)
end