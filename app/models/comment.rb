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

class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :activity

  attr_accessible :activity_id, :description, :user_id

  validates_presence_of :description, :user_id, :activity_id
end
