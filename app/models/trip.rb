class Trip < ActiveRecord::Base
  monetize :price_cents
end
