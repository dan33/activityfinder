require 'spec_helper'

describe UsersController do

  describe "GET #index" do
    before do
      sign_in :user, @user
      sign_in @user
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

  describe "GET #show" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "renders the #show view" do
      get :show, {:id => @user.id}
      response.should render_template :show
    end
  end
end