class MembershipsController < ApplicationController
	def create
    	@membership = Membership.new(params[:membership])
      if @membership.save
        redirect_to activities_path(@activity)
      else
        render :new
      end
	end

	def new
	end
end