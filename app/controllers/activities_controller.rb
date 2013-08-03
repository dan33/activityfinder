class ActivitiesController < ApplicationController

  def new
  end

  def create
    @user = current_user
    @activity = Activity.new(params[:activity])
      if @activity.save
        @user.activities << @activity
        @activity.memberships.first.role = 'owner'
        redirect_to activities_path(@activity)
      else
        render :new
      end
  end

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

end