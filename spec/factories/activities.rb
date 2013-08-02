# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    title "MyString"
    description "MyString"
    address "MyString"
    longitude 1.5
    latitude 1.5
    category_id 1
  end
end
