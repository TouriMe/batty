class TourActivity < ActiveRecord::Base
  belongs_to :tour
  belongs_to :activity
end
