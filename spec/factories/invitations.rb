FactoryGirl.define do
  factory :invitation do
    email Faker::Internet.email
    user
  end
end
