# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gender     :string(255)
#  city       :string(255)
#

require 'spec_helper'

describe User do
	describe 'A valid user' do
		before do
			@user2 = User.create(:name => 'John', :email => 'john@gmail.com', :gender => 'male', :city => 'Sydney')
			@user = User.create(:name => 'Bob Smith', :email => 'bob@gmail.com', :gender => 'female', :city => 'Sydney')
			@activity = Activity.create(:title => 'Surfing', :description => 'only Long Reef baby', :address => '9 Suffolk Avenue, Collaroy', :latitude => '-33.745521', :longitude => '151.304459', :category_id => '1')
			#@membership = Membership.create(:user_id => @user.id, :activity_id => @activity.id)
		end

		it { should have_many(:memberships) }

		it { should have_many(:activities).through(:memberships) }

		it { should have_many(:comments) }

		it "creates a user with valid information" do
			expect(@user).to be
		end

		it "should be able to create an activity" do
			@user.activities << @activity
			@user.reload
			expect(@user.activities.count).to eq(1)
		end

		it "should be a creator if they create an activity" do
			expect(@user.memberships.first.role).to eq('creator')
		end

		it "should be a member if join an activity" do
		end

		it "should be able to leave activity if member" do
		end

		it "should not be able to leave activity if creator" do
		end

		it "should be able to delete an activity if there are no members" do
		end

		it "should not be able to join an activity if already member" do
		end



		it "should be able to join an activity" do
			#@membership = Membership.create(:user_id = @user2.id, :activity_id => @activity.id)
			#@user.activities << @activity
			#expect(@activity.users.count).to eq(2)
		end
	end

	describe "An invalid user" do
		before do
			@user = User.create(:name => '', :email => '', :gender => '', :city => '')
		end

		it "should not be created" do
			expect(User.count).to eq(0)
		end
	end
end
