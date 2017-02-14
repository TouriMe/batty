class Purchase < ActiveRecord::Base

  belongs_to :purchasable, polymorphic: true
  belongs_to :driver
  belongs_to :vehicle
  belongs_to :tour
  belongs_to :address
  before_create { self.status = :unpaid }
  after_save { OrderConfirmation.confirm(self).deliver_now if self.paid? }
  enum status: [:unpaid, :paid, :confirmed]

end
