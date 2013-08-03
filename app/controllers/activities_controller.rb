class ActivitiesController < ApplicationController
	before_filter :authenticate_user!, :only => [:create, :new]

	def new
		@activity = Activity.new
	end

	def create
		@user = current_user
		@activity = Activity.new(params[:activity])
		# Not sure of the way to do this..  This creation is pushing into the membership fine, we need to find the membership where the activity id is equal to the one that was just created (after the save) and then push the role into that rather than through the user
		if @activity.save
			@user.activities << @activity
			@activity.memberships.first.role = 'owner'
			binding.pry
			@activity.save
			redirect_to @activity

			# Why doesn't this work Joel?  I have a feeling I stuffed the syntax but ya no what I mn
			# redirect_to (activity_path(@activities))
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




# I think we have done this controller in the wrong way.  We need to check is_logged_in (in application controller) before running any action here.  Then we do create and push all information at once.