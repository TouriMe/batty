class Activity < ActiveRecord::Base
  has_many :tour_activity, :dependent => :destroy
  has_many :tours, through: :tour_activity

  has_many :activity_types
end
