# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do

  		describe "POST #create" do
  			let (:user) { FactoryGirl.create(:user)}
  			sign_in user

    		context "with valid attributes" do
      		it "creates a new membership"
      		it "has a role of member"
    		end

    		context "with invalid attributes" do
      		it "does not save the new contact in the database"
      		it "re-renders the :new template"
    		end
  		end
  end
end
