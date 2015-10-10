class TripComment < ActiveRecord::Base
  belongs_to :tourist
  belongs_to :trip
  validates_presence_of :message, :trip_id, :tourist_id
end
