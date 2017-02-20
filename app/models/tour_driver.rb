class TourDriver < ActiveRecord::Base
  belongs_to :tour
  belongs_to :driver
  
  validates :driver, presence: true
end
