# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

class Category < ActiveRecord::Base
  	has_many :activities

  	attr_accessible :title

    extend FriendlyId
    friendly_id :title, use: :slugged
end
