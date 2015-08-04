# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!( name:  "Piotr",
              email: "piokaczm@gmail.com",
              username: "kaczmuch",
              city: "Tychy",
              wojewodztwo: "Śląskie",
              password:              "foobar",
              password_confirmation: "foobar",
              admin: true,
              activated: true,
              activated_at: Time.zone.now,
              invitations_left: 500
  )

#Invitation.create!( user_id: 1, email: "piokaczm@gmail.com" )

#15.times do |n|
#  Invitation.create!(user_id: 1, email: "example-#{n+1}@kupa.org")
#end

#User.create!( name:  "Example User",
#              email: "exampl@kupa.org",
#              username: "pizdek",
#              city: "Kowno",
#              wojewodztwo: "Śląskie",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin: false,
#              activated: true,
#              activated_at: Time.zone.now              
#  )

#15.times do |n|
#  name  = Faker::Name.name
#  email = "example-#{n+1}@kupa.org"
#  username = Faker::Internet.user_name
#  city = Faker::Address.city
#  password = "password"
#  User.create!(name:  name,
#               email: email,
#              username: username,
#              city: city,
#              wojewodztwo: "Śląskie",
#               password:              password,
#               password_confirmation: password,
#              activated: true,
#              activated_at: Time.zone.now)
#end



#6.times do |n|
#  title = Faker::Lorem.sentence
#  content = Faker::Lorem.paragraph
#  price = Faker::Number.digit
#  wojewodztwo = %w(Dolnośląskie Kujawsko-pomorskie Lubelskie Lubuskie Łódzkie Małopolskie Mazowieckie Opolskie Podkarpackie Podlaskie Pomorskie Śląskie Świętokrzyskie Warmińsko-mazurskie Wielkopolskie Zachodniopomorskie)
#  type = %w(rowery ramy widelce korby kierownice mostki sztyce)
#  size1 = Faker::Number.digit
#  size2 = Faker::Number.digit
#  city = Faker::Address.city
#  picture = open("http://res.cloudinary.com/kgo/image/upload/v1435488208/ao2spypvaco60umzcevz.jpg")
#  new = [true, false]
#  user = (1..10).to_a
#  Advert.create!( title: title,
#                  content: content,
#                  price: price,
#                  wojewodztwo: wojewodztwo[Random.new.rand(0..9)],
#                  new: new[Random.new.rand(0..1)],
#                  category: type[Random.new.rand(0..6)],
#                  size1: size1,
#                  size2: size2,
#                  city: city,
#                  user_id: user[Random.new.rand(0..9)],
#                  picture: picture)
end
  