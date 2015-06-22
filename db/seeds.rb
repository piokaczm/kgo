# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!( name:  "Example User",
              email: "example@kupa.org",
              username: "piczek",
              city: "Kowno",
              wojewodztwo: "Śląskie",
              password:              "foobar",
              password_confirmation: "foobar",
              admin: true,
              activated: true,
              activated_at: Time.zone.now              
  )

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@kupa.org"
  username = Faker::Internet.user_name
  city = Faker::Address.city
  password = "password"
  User.create!(name:  name,
               email: email,
              username: username,
              city: city,
              wojewodztwo: "Śląskie",
               password:              password,
               password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end