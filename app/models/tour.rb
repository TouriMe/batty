class Tour < ActiveRecord::Base
  include Commentable
  extend FriendlyId

  mount_uploader :card_img, TourCardUploader

  has_many :purchases, as: :purchasable
  has_many :images, as: :imagable

  friendly_id :name, use: [:slugged, :finders]

  monetize :tuktuk_price_cents
  monetize :car_price_cents

  validates_presence_of :name

  accepts_nested_attributes_for :images, allow_destroy: true

  # to support chinese (utf8) slugs
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def drivers
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
end
