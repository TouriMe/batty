class Purchase < ActiveRecord::Base
  belongs_to :purchasable, polymorphic: true
  belongs_to :driver
  belongs_to :vehicle
  belongs_to :trip

  before_create { self.status = :unpaid }
  after_save { OrderConfirmation.confirm(self).deliver_now if self.paid? }


  enum status: [:unpaid, :paid, :confirmed]

end
