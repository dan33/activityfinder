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

class User < ActiveRecord::Base
	validates_presence_of :name, :email, :city, :gender

	has_many :memberships
	has_many :activities, :through => :memberships
	has_many :comments

	attr_accessible :email, :name, :city, :gender
end
