class Trip < ActiveRecord::Base
  monetize :price_cents
  has_many :trip_comments
end
