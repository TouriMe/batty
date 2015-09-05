class DriverComment < ActiveRecord::Base
  belongs_to :tourist
  belongs_to :driver

  validates_presence_of :message, :rating, :driver_id, :tourist_id
end
