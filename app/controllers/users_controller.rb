class UsersController < ApplicationController

	def index
    @activity = Activity.find(params[:activity_id])
    @users = @activity.users
	end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @activities = current_user.activities
  end

end
