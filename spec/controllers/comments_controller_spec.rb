require 'spec_helper'

describe CommentsController do
  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @activity = FactoryGirl.create(:activity)
    @membership = @user.memberships.create(:activity_id => @activity.id, :role => 'owner')
    @comment = @activity.comments.new(:activity_id => @activity.id, :user_id => @user.id, :description => 'this is a comment')
  end

  describe "GET #index" do

    it "should give the comments in an instance variable" do
      @comment.save
      @comments = @activity.comments
      expect(@comments.count).to eq(1)
    end
  end
  describe "POST to #create" do
    context "comment with valid information" do
      it "should create a comment" do
        @comment.save
        expect(Comment.count).to eq(1)
      end

      it "should redirect to the activity page" do
        post :create, {:comment => {:activity_id => @activity.id, :user_id => @user.id, :description => 'this is a comment'}}
        expect(response.status).to eq(302)
        expect(response).to redirect_to @activity
      end
    end

    context "comment with invalid information" do
      before do
        post :create, {:comment => {:activity_id => @activity.id}}
      end

      it "should not create a comment" do
        expect(Comment.count).to eq(0)
      end

      it "should redirect to the activity page" do
        expect(response.status).to eq(302)
        expect(response).to redirect_to @activity
      end
    end
  end

end
