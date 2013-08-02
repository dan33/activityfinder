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

class Activity < ActiveRecord::Base
  before_save :geocode
	has_many :memberships
	belongs_to :category
	has_many :users, :through => :memberships
	has_many :comments

  attr_accessible :address, :category_id, :description, :latitude, :longitude, :title

  def geocode
    result = Geocoder.search(self.address).first
      if result.present?
        self.latitude = result.latitude
        self.longitude = result.longitude
      end
  end
end
