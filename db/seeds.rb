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
             activated: true,
             activated_at: Time.zone.now,
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
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
5.times do
  description = Faker::Lorem.sentence(200)
  street_address = "123 Place Street"
  city = "Reno"
  state = "NV"
  zip_code = "89511"
  primary_contact = "(555)123-4567"
  secondary_contact = "555-555-5555"
  listing_status = "active"
  users.each { |user| user.listings.create!(description: description, street_address: street_address,
                                            city: city, state: state, zip_code: zip_code, primary_contact: primary_contact,
                                            secondary_contact: secondary_contact, listing_status: listing_status) }
end

users = User.order(:created_at).take(2)
2.times do
  description = Faker::Lorem.sentence(200)
  street_address = "123 Place Street"
  city = "Reno"
  state = "NV"
  zip_code = "89512"
  primary_contact = "(555)123-4567"
  secondary_contact = "555-555-5555"
  listing_status = "active"
  users.each { |user| user.listings.create!(description: description, street_address: street_address,
                                            city: city, state: state, zip_code: zip_code, primary_contact: primary_contact,
                                            secondary_contact: secondary_contact, listing_status: listing_status) }
end