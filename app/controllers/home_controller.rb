class HomeController < ApplicationController
  def index
    @activity = Activity.new
  end
end
