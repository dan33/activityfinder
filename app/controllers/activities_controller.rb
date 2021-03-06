class ActivitiesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :locate]
  before_filter :authorize_user, :only => [:edit, :update, :destroy]

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

    @categories.each do |category|
      cats.push({
                  :id => category.id,
                  :title => category.title,
                  :activities => category.activities,
                  :image => category.image.url
      })
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render :json => cats }
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @comments = @activity.comments
    @comment = Comment.new(:activity_id => params[:activity_id])
    @owner = @activity.owner_name
    # check to see if users are evident here
  end

  # def edit
  #   @activity = Activity.find_by_slug(params[:id])
  #   render 'edit'
  # end

  def update
    @activity = Activity.find_by_slug(params[:id])
    if @activity.update_attributes(params[:activity])
      redirect_to @activity
    else
      render 'edit'
    end
  end

  def destroy
    @activity = Activity.find_by_slug(params[:id])
    #check user is the only user remaining and also the owner
    if @activity.users == [current_user] && owner?
      @activity.destroy
      redirect_to root_path
      flash[:notice] = "You successfully deleted the activity"
    else
      redirect_to root_path
      flash[:notice] = "You cannot delete an activity whilst it has other members"
    end
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
                    :activities => category.activities,
                    :image => category.image.url
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
      flash[:notice] = "Please enter a valid location"
      redirect_to root_path
    end
  end

  private

  def authorize_user
    @activity = Activity.find(params[:id])
    unless current_user.memberships.where(:activity_id => @activity.id).first.role == "owner"
      redirect_to @activity
      flash[:notice] = "You are not authorised to edit this activity"
    end
  end
end
