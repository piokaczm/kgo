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

15.times do |n|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph
  price = Faker::Number.digit
  wojewodztwo = %w(Dolnośląskie Kujawsko-pomorskie Lubelskie Lubuskie Łódzkie Małopolskie Mazowieckie Opolskie Podkarpackie Podlaskie Pomorskie Śląskie Świętokrzyskie Warmińsko-mazurskie Wielkopolskie Zachodniopomorskie)
  type = %w(Rower Rama Widelec Korba Kolo Kierownica Mostek Sztyca Siodlo Inne)
  size1 = Faker::Number.digit
  size2 = Faker::Number.digit
  city = Faker::Address.city
  new = [true, false]
  user = (1..20).to_a
  Advert.create!( title: title,
                  content: content,
                  price: price,
                  wojewodztwo: wojewodztwo[Random.new.rand(0..9)],
                  new: new[Random.new.rand(0..1)],
                  type: type[Random.new.rand(0..9)],
                  size1: size1,
                  size2: size2,
                  city: city,
                  user_id: user.shift)
end
  