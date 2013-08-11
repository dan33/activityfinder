require 'spec_helper'

describe ActivitiesController do
  describe "GET #index" do
    before do
      5.times { |i| @activity = FactoryGirl.create(:activity) }
    end

    context "as HTML request" do

      before do
        get :index
      end

      it "should respond with a status 302" do
        expect(response.status).to eq(302)
        expect(response).to(redirect_to(root_path))
      end

      it "should give the activities in an instance variable" do
        expect(assigns(:activities)).to be
        expect(assigns(:activities).length).to eq(5)
        expect(assigns(:activities).first.class).to eq(Activity)
      end
    end

    context 'as JSON request' do
      # before { pending }
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
        @category = Category.create(:title => 'Relaxation')
        @activity = Activity.create( :title => "blah", :description => "excellent activity", :category_id => 1, :address => "Bondi Road Medical Centre, Bondi Road, Bondi, New South Wales")
        @category.activities << @activity
        @category.save
        @activity.save

        xhr :get, :index, {}

        @data = JSON.parse(response.body)
      end

      it "should give the categories in an instance variable" do
        expect(assigns(:categories)).to be
      end

      it "should give the activities in an instance variable" do
        expect(assigns(:activities)).to be
      end

      it "should have the category Relaxation in the JSON response" do
        expect(@data[0]['title']).to eq('Relaxation')
      end
    end
  end

  describe "GET #show" do
    before do
      @user = FactoryGirl.create(:user)
      @activity = FactoryGirl.create(:activity)
      @membership = @user.memberships.create(:activity_id => @activity.id, :role => 'owner')
    end


    context "as a signed in user" do
      it "renders the #show view" do
        sign_in @user
        get :show, {:id => @activity.id}
        expect(response).to render_template("show")
      end
    end

    context "when not logged in" do
      it "redirects to root" do
        get :show, {:id => @activity.id}
        expect(response).to redirect_to("/users/sign_in")
      end
    end
  end

  describe 'POST to #create' do
    context "activity with valid information" do
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
        post :create, {:activity => { :title => "blah", :description => "excellent activity", :category_id => 5, :address => "Bondi Road Medical Centre, Bondi Road, Bondi, New South Wales"}}
      end

      it "should redirect to the show action" do
        expect(response.status).to eq(302)
        expect(response).to(redirect_to(assigns(:activity)))
      end

      it "should increase the number of activities" do
        expect(Activity.count).to eq(1)
      end
    end
  end


  context "activity with invalid information" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      post :create, {:activity => { :title => "blah"} }
    end

    it "should give us a 200 success" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "should render the new template" do
      response.should render_template :new
    end

    it "should not increase the number of activities" do
      expect(Activity.count).to eq(0)
    end
  end

  describe 'POST to #locate' do
    # before { pending }
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    context "with valid information" do
      before do
        @category = Category.create(:title => 'Relaxation')
        @activity = Activity.create( :title => "blah", :description => "excellent activity", :category_id => 1, :address => "Bondi Road Medical Centre, Bondi Road, Bondi, New South Wales")
        @category.activities << @activity
        @category.save
        @activity.save

        xhr :post, :locate,  { :address => "New York"}
        @data = JSON.parse(response.body)
      end

      it "should have a response code of 200" do
        response.code.should == "200"
      end

      it "should give content type JSON" do
        expect(response.content_type).to eq('application/json')
      end

      it "should parse as JSON" do
        lambda { JSON.parse(response.body) }.should_not raise_error
      end

      it "should assign a latitude and longitude" do
        expect(assigns(:latlong)).to be
      end

      it "should have the latitude and logitude for New York in the JSON response" do

        expect(@data['latlong'][0]).to eq(40.7143528)
        expect(@data['latlong'][1]).to eq(-74.00597309999999)
      end

      it "should have the category Relaxation in the JSON response" do
        expect(@data['cats'][0]['title']).to eq('Relaxation')
      end

      it "should have the activity blah in the JSON response" do
        expect(@data['cats'][0]['activities'][0]['title']).to eq ('blah')
      end

    end
  end

  describe "Get activities #update" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @activity4 = FactoryGirl.create(:activity)
      @user.activities << @activity4
      @user.save
      @activity5 = mock_model(Activity)
      @membership = @user.memberships.create(:activity_id => @activity4.id)
      @user.memberships[0].save
    end

    it "finds the correct activity" do
      @activity = Activity.find(@activity3.id)
    end

    it "and if valid it should be able to update attributes" do
      params = { :title => 'Bondi', :description => 'Bondi', :address => 'Bondi Beach' }
      @activity5.should_recieve(:update_attributes).with(params)
      put :update, :id => @activity5.id, :activity => params
    end

# params = {'email' => 'example@example.com'}
#         @user.should_receive(:update_attributes).with(params)
#         put :update, :id => @user.id, :user => params


#     it 'should pass movie object the new attribute value to updated' do
#   fake_new_rating = 'PG-15'
#   Movie.stub(:find).and_return(@fake_movie)
#   @fake_movie.should_receive(:update_attributes!).with("rating" => fake_new_rating).and_return(:true)
#   put :update, :id => @fake_movie.id, :movie => {:rating => fake_new_rating}
# end

    it "should reject invalid updates" do
      @activity3.title = nil
      @activity3.should_not be_valid
    end

    it "should redirect if the update was invalid" do
      render :template => "/"
      rendered.should include("/activities/_editform.html")
    end
  end

  describe "Get activities #destroy" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @activity3 = FactoryGirl.create(:activity)
      @user.activities << @activity3
      @user.save
      @membership = @user.memberships.create(:activity_id => @activity3.id)
      @user.memberships[0].save
    end

    it "should be able to find the correct activity" do
      Activity.find(@activity3.slug)
    end

    it "should find the users in the activity" do
      @activity3.users == @user
      expect(@activity3.users.count).to eq(1)
    end

    # it "should destroy that activity" do
    #   @user.memberships.destroy_all
    #   @activity3.destroy
    #   expect(@activity3).to_not be
    # end

    it "should then redirect to the root page" do
      response.should redirect_to(root_path)
    end
  end
end


#     end

#     it "should render the edit partial" do
#        expect(response).to render_template("edit")
#     end
#   end
# end

