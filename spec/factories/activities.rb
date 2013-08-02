# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    title {["beach running", "animal photography", "city walk", "bush walking", "architecture photography", "surfing at Bondi"].sample}
    description "Join my awesome group and we can share our interest which is great"
    address {["Bondi Road Medical Centre, Bondi Road, Bondi, New South Wales", "Manly Ferry, Alfred Street, Sydney, New South Wales", "Mosman High School, Military Road, Mosman, New South Wales"].sample}
  end
end
