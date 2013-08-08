# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#  image      :string(255)
#

require 'spec_helper'

describe Category do
  describe 'A valid category' do
  		before do
  			@category = FactoryGirl.create(:category)
  		end

  		it { should have_many(:activities) }

  		it "should have a title" do
  			expect(@category.title).to_not eq(nil)
  		end
  end
end
