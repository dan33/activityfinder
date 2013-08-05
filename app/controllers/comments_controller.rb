class CommentsController < ApplicationController
  before_filter :get_activity

  def new
    #@comment = @activity.comments.new
  end

  def create
    @comment = @activity.comments.new(params[:comment])
    @comment.user = current_user
      if @comment.save
        redirect_to @activity
      else
        redirect_to @activity
      end
  end

  def index
    @comments = @activity.comments
  end

  private
  def get_activity
    @activity = Activity.find(params[:comment][:activity_id])
  end

end
