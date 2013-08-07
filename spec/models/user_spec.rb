# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  gender                 :string(255)
#  city                   :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  longitude              :float
#  latitude               :float
#  slug                   :string(255)
#  image                  :string(255)
#

require 'spec_helper'

describe User do
	describe 'A valid user' do
		before do
			@user2 = FactoryGirl.create(:user)
			@user = FactoryGirl.create(:user)
			@activity = FactoryGirl.create(:activity)
			@category = FactoryGirl.create(:category)
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
			@activity.save
			@user.reload
			expect(@user.activities.count).to eq(1)
		end

		it "should set longitude and latitude based off city" do
			expect(@user.longitude).to_not eq(nil)
			expect(@user.latitude).to_not eq(nil)
		end

		it "should be a creator if they create an activity" do
			@user2.activities << @activity
			@activity.save
			@user2.reload
			expect(@user2.memberships.last.role).to eq('owner')
		end

		it "should be a member if join an activity" do
			pending
		end

		it "should be able to leave activity if member" do
			pending
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
			@user2000 = User.create(:name => "free", :email => "free@me.com", :city => "rrrrrrrrgjh4", :password => "password", :password_confirmation => "password")
			@count = User.count
			@user = User.create(:name => '', :email => '', :gender => '', :city => '')
		end

		it "should not be created" do
			expect(User.count).to eq(@count)
		end

		it "should set long and lat to AUS default if they don't enter a valid city" do
			expect(@user2000.latitude).to eq(32.3456)
			expect(@user2000.longitude).to eq(141.4346)
		end
	end
end
