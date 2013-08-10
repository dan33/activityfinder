class MembershipsController < ApplicationController

  def create
    @activity = Activity.find(params[:activity_id])
    @membership = current_user.memberships.create(:activity_id => @activity.id)
    if @membership.save
      redirect_to @activity
    else
      flash[:notice] = "Sorry you are unable to join this activity"
    end
  end

  def new
  end

  def destroy
    @membership = current_user.memberships.find(params[:id])
    @membership.destroy
    flash[:notice] = "Removed membership."
    redirect_to root_path
  end

end
