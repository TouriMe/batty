class Tourist < ActiveRecord::Base
  has_many :driver_comments
  has_many :trip_comments
end

