FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    username Faker::Internet.user_name
    sequence(:email) { |n| "user#{n}@example.com"}
    city Faker::Address.city
    wojewodztwo User::WOJLIST.sample
    activation_token Faker::Lorem.characters(20)
    password 'foobar'

    factory :user_with_invitations do
      invitation
    end

    factory :user_with_advert do
      advert
    end
  end

end
