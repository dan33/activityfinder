# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  description :string(255)
#  user_id     :integer
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Comment do
	describe 'A comment' do
		before do
			@user = FactoryGirl.create(:user)
			@comment = FactoryGirl.create(:comment)
		end

		it { should belong_to(:user) }
		it { should belong_to(:activity) }

		it "should have a descrption" do
			expect(@comment.description).to_not eq(nil)
		end
	end
end