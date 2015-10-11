class Trip < ActiveRecord::Base
  include Commentable

  monetize :price_cents
  has_many :trip_comments
end
