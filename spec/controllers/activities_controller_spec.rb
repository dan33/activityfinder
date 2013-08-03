require 'spec_helper'

describe ActivitiesController do
  describe "GET #index" do
    before do
      5.times { |i| @activity = FactoryGirl.create(:activity) }
    end

    describe 'as HTML' do
      before do
        get :index
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should give the activities in an instance variable" do
        expect(assigns(:activities)).to be
        expect(assigns(:activities).length).to eq(5)
        expect(assigns(:activities).first.class).to eq(Activity)
      end
    end
  end

  describe "GET #show" do
    before do
      @activity = FactoryGirl.create(:activity)
    end

    it "renders the #show view" do
      get :show, {:id => @activity.id}
      response.should render_template :show
    end
  end

  describe 'POST to #create' do
    context "activity with valid information" do
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
        post :create, {:activity => { :title => "blah", :description => "excellent activity", :category_id => 5, :address => "Bondi Road Medical Centre, Bondi Road, Bondi, New South Wales"}}
        # @activity = FactoryGirl.build(:activity)
        # @activity.save
      end

      it "should redirect to the show action" do
        expect(response.status).to eq(302)
        expect(response).to(redirect_to(activities_path(assigns(:activity))))
      end

      it "should increase the number of activities" do
        expect(Activity.count).to eq(1)
      end
    end

    context "activity with invalid information" do
      before do
        #post :create, {}
      end

      it "should give us a 200 success" do
        #expect(response).to be_success
        #expect(response.status).to eq(200)
      end

      it "should render the new template" do
        #response.should render_template :new
      end

      it "should not increase the number of activities" do
        #expect(Activity.count).to eq(0)
      end
    end
  end
end
