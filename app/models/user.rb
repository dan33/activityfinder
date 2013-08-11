# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  gender                 :string(255)
#  city                   :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  longitude              :float
#  latitude               :float
#  slug                   :string(255)
#  image                  :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  before_save :geocode

  attr_accessible :email, :name, :city, :gender, :password, :password_confirmation, :image, :remote_image_url, :remove_image

  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable

  validates_presence_of :name, :email, :city

  has_many :memberships, :dependent => :destroy
  has_many :activities, :through => :memberships
  has_many :comments

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
