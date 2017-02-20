class Tour < ActiveRecord::Base
  include Commentable
  extend FriendlyId

  mount_uploader :card_img, TourCardUploader

  has_many :purchases, as: :purchasable
  has_many :images, as: :imagable
  
  has_many :tour_drivers, :dependent => :destroy
  has_many :drivers, through: :tour_drivers

  friendly_id :name, use: [:slugged, :finders]

  monetize :tuktuk_price_cents
  monetize :car_price_cents

  validates_presence_of :name

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :tour_drivers, allow_destroy: true, reject_if: :all_blank

  # to support chinese (utf8) slugs
  def normalize_friendly_id(input)
    # input.to_s.to_slug.normalize.to_s
  end

  def available_drivers
    if tuktuk_price.to_i == 0
      Driver.joins(:vehicles).where("vehicles.name = 'Car' AND drivers.is_active = true")
    else
      Driver.where(is_active: true)
    end
  end

  def f_pay
    if down_payment && booking_fee
      down_payment + booking_fee
    else
      tuktuk_price
    end
  end

  def hero_unit_image
    images.where(is_hero: true).first
  end

  def cover_image
    hero_image = images.where(is_hero: true).first
    if hero_image.present?
      hero_image.url
    else
      images.first.url
    end
  end

  def seo_tags
    {
      title: "#{name} - #{description}",
      keywords: "#{name} - #{description}",
      description: "#{name} - Distance #{distance} km, Duration #{duration} h, "\
      "#{checkpoint_num} Checkpoints potential visit, Start at #{tour_start}, End at #{tour_end}, "\
      "Price by Remork (tuk tuk) #{tuktuk_price.to_i} USD, by Car #{car_price.to_i} USD'"
    }
  end

  def all_driver
    Driver.all.pluck(:first_name)
  end
end
