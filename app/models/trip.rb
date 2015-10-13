class Trip < ActiveRecord::Base
  include Commentable

  has_many :purchases, as: :purchasable

  monetize :price_cents
end
