FactoryGirl.define do
  factory :advert do
    sequence(:title) { |n| "Advert #{n}" }
    sequence(:picture) { |n| "image#{n}.jpg" }
    content Faker::Lorem.sentences(8)
    wojewodztwo Advert::WOJLIST.sample
    price Faker::Number.decimal(2)
    new [true, false].sample
    city Faker::Address.city
    size1 Faker::Number.decimal(2)
    size2 Faker::Number.decimal(2)
    category Advert::TYPELIST.sample
    user
  end
end
