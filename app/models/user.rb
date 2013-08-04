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
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  before_save :geocode

  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_presence_of :name, :email, :city

	has_many :memberships, :dependent => :destroy
	has_many :activities, :through => :memberships
	has_many :comments

	attr_accessible :email, :name, :city, :gender, :password, :password_confirmation

  def geocode
    #over API query limit fix
    self.latitude = 32.3456
    self.longitude = 141.4346

    # result = Geocoder.search(self.city).first
    #   if result.present?
    #     self.latitude = result.latitude
    #     self.longitude = result.longitude
    #   else
    #     self.latitude = 32.3456
    #     self.longitude = 141.4346
    #   end
  end

end
