class Driver < ActiveRecord::Base
  include Commentable
  extend FriendlyId

  mount_uploader :avatar_url, DriverAvatarUploader
  mount_uploader :card_img, DriverCardUploader
  mount_uploader :background_url, DriverBackgroundUploader

  friendly_id :first_name, use: [:slugged, :finders]
  obfuscate_id

  belongs_to :normal_user

  has_many :languages, class_name: 'DriverLanguage'
  has_many :images, as: :imagable
  has_many :driver_cities
  has_many :driver_vehicles

  has_many :tour_drivers, :dependent => :destroy
  has_many :tours

  has_many :cities, through: :driver_cities
  has_many :vehicles, through: :driver_vehicles
  has_many :tours, through: :tour_drivers

  has_many :purchases, as: :purchasable  
  validates_presence_of :first_name, :phone

  scope :active, ->{where(is_active: true)}

  accepts_nested_attributes_for :languages, :driver_cities, :driver_vehicles, :images, allow_destroy: true

  # to support chinese (utf8) slugs
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def available_tours
    if vehicles.count > 1
      Tour.where(is_active: true)
    else
      Tour.where(is_active: true).where.not(tuktuk_price_cents: 0)
    end
  end

  def cities_label
    cities.pluck('name').join(',')
  end

  def language_codes_label
    languages.pluck('language_code').join(',')
  end

  def full_description
    if description.present?
      first_name + ' - ' + description
    else
      first_name
    end
  end

  def seo_tags
    {
      title: "#{first_name} - #{short_desc}, #{cities_label}",
      keywords: "#{first_name}, #{cities_label}, Speak #{language_codes_label}, "\
      "#{driving_experience} years of driving experience",
      description: "#{full_description}"
    }
  end

  def full_name
    first_name + " " +last_name
  end
end
