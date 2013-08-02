# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    gender {["male", "female"].sample}
    city {["Sydney", "Melbourne", "Perth", "Adelaide", "Brisbane"].sample}
  end
end
