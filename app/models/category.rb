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

class Category < ActiveRecord::Base
  	has_many :activities

  	attr_accessible :title, :image, :remove_image

    mount_uploader :image, ImageUploader

    extend FriendlyId
    friendly_id :title, use: [:slugged, :history]
end
