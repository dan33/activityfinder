require 'spec_helper'

describe UsersController do

  describe "GET #show" do
    before do
      @user = FactoryGirl.create(:user)
      @activity = FactoryGirl.create(:activity)
      @user.activities << @activity
    end

    # it "renders the #show view" do
    #   get :show, {:id => @user.id}
    #   response.should render_template :show
    # end

    it "should show all activities the user is a member or owner of" do
      expect(@user.activities.count).to eq(1)
    end
  end

end
