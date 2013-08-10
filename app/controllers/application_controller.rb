class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :member?, :owner?

  def member?
    @activity = Activity.find_by_slug(params[:id])
    @activity.users.include?(current_user)
  end

  def owner?
    @activity = Activity.find_by_slug(params[:id])
    current_user.memberships.where(:activity_id => @activity.id).first.role == 'owner'
  end

end
