# == Schema Information
#
# Table name: memberships
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Membership < ActiveRecord::Base
	has_many :activities
	belongs_to :user

  attr_accessible :user_id, :activity_id
end
