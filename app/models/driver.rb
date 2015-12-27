class Driver < ActiveRecord::Base
  include Commentable
  extend FriendlyId

  mount_uploader :avatar_url, DriverAvatarUploader
  mount_uploader :card_img, DriverCardUploader
  mount_uploader :background_url, DriverBackgroundUploader

  friendly_id :full_name, use: [:slugged, :finders]
  # obfuscate_id

  belongs_to :normal_user

  has_many :languages, class_name: 'DriverLanguage'
  has_many :images, as: :imagable
  has_many :driver_cities
  has_many :driver_vehicles

  has_many :cities, through: :driver_cities
  has_many :vehicles, through: :driver_vehicles

  has_many :purchases, as: :purchasable  
  validates_presence_of :first_name, :phone

  scope :active, ->{where(is_active: true)}

  accepts_nested_attributes_for :languages, :driver_cities, :driver_vehicles, :images, allow_destroy: true

  def full_name
    self.first_name + ' ' + self.last_name
  end

  # to support chinese (utf8) slugs
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
end
