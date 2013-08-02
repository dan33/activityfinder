# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
 	title {["Running", "Walking", "Surfing", "Photography", "Nightlife", "Coding ehhhhhhh"].sample}
  end
end
