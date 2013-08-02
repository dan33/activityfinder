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
			@user = User.create(:name => 'Bob Smith', :email => 'bob@gmail.com', :gender => 'female', :city => 'Sydney')
		end

		it { should have_many(:memberships) }

		it { should have_many(:activities).through(:memberships) }

		it { should have_many(:comments) }

		it "creates a user with valid information" do
			expect(@user).to be
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
