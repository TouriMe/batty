class Trip < ActiveRecord::Base
  include Commentable
  extend FriendlyId
  
  has_many :purchases, as: :purchasable
  has_many :images, as: :imagable
  
  friendly_id :name, use: [:slugged, :finders]

  monetize :tuktuk_price_cents
  monetize :car_price_cents

  validates_presence_of :name, :price_cents, :price_currency

  accepts_nested_attributes_for :images, allow_destroy: true
  
  # to support chinese (utf8) slugs
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
 
end
