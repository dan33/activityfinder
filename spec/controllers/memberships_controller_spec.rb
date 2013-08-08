require 'spec_helper'

describe MembershipsController do
  describe "POST #create" do
    before do
      @user = FactoryGirl.create(:user)
      @activity = FactoryGirl.create(:activity)
      sign_in @user
    end

    context "with valid attributes" do
      before do
        post :create, { :user_id => @user.id, :activity_id => @activity.id}
      end

      it "creates a new membership" do
        expect(Membership.count).to eq(1)
      end

      it "has a role of member" do
        expect(Membership.first.role).to eq("member")
      end
    end

    context "with invalid attributes" do
      before do
        post :create, { :user_id => nil, :activity_id => @activity.id}
      end

      it "it doesn't create a membership" do
        expect(Membership.count).to eq(1)
      end

      it "flashes an error message" do
        pending
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @activity = FactoryGirl.create(:activity)
      @membership = @user.memberships.create(:activity_id => @activity.id, :role => 'owner')
    end

    it "should be able to find the current membership" do
      @membership = @user.memberships.where(:activity_id => @activity.id, :role => 'owner')
    end

    it "should be able to delete the current membership" do
      delete :destroy, { :id => @membership.id }
      expect(@user.memberships.count).to eq(0)
    end
  end
end

# CONTROLLER

#membership = Membership.create(:user_id => current_user.id, :activity_id => params[:id] )