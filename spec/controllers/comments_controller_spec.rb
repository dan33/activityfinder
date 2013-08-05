require 'spec_helper'

describe CommentsController do
  before do
      @user = FactoryGirl.create(:user)
      @activity = FactoryGirl.create(:activity)
      @membership = @user.memberships.create(:activity_id => @activity.id, :role => 'owner')
    end



end
