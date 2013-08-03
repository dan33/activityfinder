class ActivitiesController < ApplicationController

  def new
  end

  def create
    @user = current_user
    @activity = Activity.new(params[:activity])
    @user.activities << @activity
    @user.save
    @activity.memberships.first.role = 'owner'
      if @activity.save
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