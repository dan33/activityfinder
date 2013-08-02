require 'spec_helper'

describe UsersController do
  describe "GET for index" do
    before do
      5.times { |i| @user = FactoryGirl.create(:user) }
    end

    describe 'as HTML' do
      before do
        get :index
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should give the users in an instance variable" do
        expect(assigns(:users)).to be
        expect(assigns(:users).length).to eq(5)
        expect(assigns(:users).first.class).to eq(User)
      end
    end
  end

  describe 'GET to show' do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "should render the show template" do
      get :show, {:id => @user.id}
      expect(response).to render_template("show")
    end
  end
end
