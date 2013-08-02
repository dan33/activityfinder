# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :comment do
		description "This is a comment, woooooo!"
		user_id 1
		activity_id 1
	end
end
