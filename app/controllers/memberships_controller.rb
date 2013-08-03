class MembershipsController < ApplicationController
	def create
    @activity = Activity.find(params[:activity_id])
    @membership = current_user.memberships.create(:activity_id => @activity.id)
      if @membership.save
        redirect_to @activity
      else
          #render error messages partial
      end
	end

	def new
	end
end