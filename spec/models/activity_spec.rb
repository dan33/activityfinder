# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  address     :string(255)
#  longitude   :float
#  latitude    :float
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Activity do
  describe "An activity" do
    before do
      @activity = FactoryGirl.create(:activity)
      @user = FactoryGirl.create(:user)
      @user.activities << @activity

    end

    it { should have_many(:memberships) }
    it { should belong_to(:category) }
    it { should have_many(:users).through(:memberships) }
    it { should have_many(:comments) }

    it "should set longitude and latitude on create" do
      expect(@activity.longitude).not_to eq(nil)
    end

    it "should have valid Information" do
      expect(@activity.title).not_to eq(nil)
      expect(@activity.description).not_to eq(nil)
      expect(@activity.address).not_to eq(nil)
      expect(@activity.category_id).not_to eq(nil)
    end
  end
end
