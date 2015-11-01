FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    username Faker::Internet.user_name
    sequence(:email) { |n| "user#{n}@example.com"}
    city Faker::Address.city
    wojeowdztwo User::WOJLIST.sample
    password 'foobar'

    factory :user_with_invitations do
      invitation
    end

    factory :user_with_advert do
      advert
    end
  end

end
