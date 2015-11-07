class Trip < ActiveRecord::Base
  include Commentable

  has_many :purchases, as: :purchasable
  has_many :images, as: :imagable

  monetize :price_cents

  accepts_nested_attributes_for :images, allow_destroy: true
end
