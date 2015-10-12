class Trip < ActiveRecord::Base
  include Commentable

  monetize :price_cents
end
