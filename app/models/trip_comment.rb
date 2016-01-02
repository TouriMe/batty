class TripComment < ActiveRecord::Base
  belongs_to :tourist
  belongs_to :tour
  validates_presence_of :message, :trip_id, :tourist_id
end
