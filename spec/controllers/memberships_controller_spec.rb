require 'spec_helper'

describe MembershipsController do
	describe "POST #create" do
		before do
			@user = FactoryGirl.create(:user)
			@activity = FactoryGirl.create(:activity)
			sign_in @user
		end

 		context "with valid attributes" do
   		it "creates a new membership" do
   			post :create, {:membership => { :user_id => @user.id, :activity_id => @activity.id}}
   			expect(Membership.count).to eq(1)
   		end

   		it "has a role of member" do
   		end
 		end

 		context "with invalid attributes" do
   		it "does not save the new contact in the database" do
   		end
   		it "re-renders the :new template" do
   		end
 		end
	end
end

# CONTROLLER

#membership = Membership.create(:user_id => current_user.id, :activity_id => params[:id] )