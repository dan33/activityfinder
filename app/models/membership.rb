# == Schema Information
#
# Table name: memberships
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  role        :string(255)      default("member")
#

class Membership < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  attr_accessible :user_id, :activity_id, :role
  validates_presence_of :user_id, :activity_id, :role
  validates_uniqueness_of :activity_id, :message => "you have already joined this activity", :scope => 'user_id'


end
