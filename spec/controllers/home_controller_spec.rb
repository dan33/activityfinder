require 'spec_helper'

describe HomeController do
  before do
    get :index
  end

  describe "GET #index" do
    it "should assign @activity" do
      expect(assigns(:activity)).to be
    end
  end
end
