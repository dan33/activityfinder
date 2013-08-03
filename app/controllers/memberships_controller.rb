class MembershipsController < ApplicationController
	def create
    @membership = Membership.new(params[:membership])
    # @membership.user = current_user
    # @membership.activity = Activity.find(params[:activity])
      if @membership.save
        redirect_to [@activity]
      else
        render :new
      end
 	end

 	def new
 	end
end
