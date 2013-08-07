class ActivitiesController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :new]
  before_filter :authorize_user, :only => [:update]

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.create(params[:activity])
    @membership = current_user.memberships.create(:activity_id => @activity.id, :role => 'owner')
      if @activity.save
        redirect_to @activity
      else
        render :new
      end
  end

  def index
    @activities = Activity.all
    @categories = Category.all
    cats = []
    act = []

    @categories.each do |category|
      cats.push({
        :id => category.id,
        :title => category.title,
        :activities => category.activities,
        :image => category.image.url
      })
    end

    @activities.each do |activity|
      act.push({
        :id => activity.id,
        :title => activity.title,
        :users => activity.users
      })
    end

    respond_to do |format|
      format.html
      format.json {
        render :json => {
          :cats => cats,
          :act => act
          }
        }
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @comments = @activity.comments
    @comment = Comment.new(:activity_id => params[:activity_id])
    @owner = @activity.is_owner
    # check to see if users are evident here
  end

 def locate
    result = Geocoder.search(params[:address]).first
      if result.present?
        @latlong = [result.latitude, result.longitude]
        @categories = Category.all
        cats = []

        @categories.each do |category|
        cats.push({
          :id => category.id,
          :title => category.title,
          :activities => category.activities

        })
        end

        respond_to do |format|
          format.json {
            render :json => {
              :latlong => @latlong,
              :cats => cats
              }
            }
        end
      else
        #render error message
      end
   end

   private
   def authorize_user
      @activity = Activity.find(params[:id])
      unless current_user?(@activity.user)
        redirect_to @activity
      end
    end
end
