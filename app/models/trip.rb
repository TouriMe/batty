class Trip < ActiveRecord::Base
  include Commentable
  extend FriendlyId
  
  has_many :purchases, as: :purchasable
  has_many :images, as: :imagable
  
  friendly_id :name, use: :slugged

  monetize :price_cents

  accepts_nested_attributes_for :images, allow_destroy: true
  
  # to support chinese (utf8) slugs
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
 
end
