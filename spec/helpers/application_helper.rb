require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ActivitiesHelper. For example:
#
# describe ActivitiesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ApplicationHelper do
  describe "access to devise resource from homepage" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "tell devise which resource is currently being accessed" do
      expect(@resource).to eq(@user)
    end


  end
end
