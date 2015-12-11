class Purchase < ActiveRecord::Base
  belongs_to :tourist
  belongs_to :purchasable, polymorphic: true
  belongs_to :driver
  belongs_to :vehicle
  belongs_to :trip

  before_create { self.status = :unpaid }
  after_save { OrderConfirmation.confirm(self).deliver_now if self.paid? }

  validate do
    if self.start_date
      errors.add(:start_date, 'start_date must be 1 day later') unless self.start_date > Time.now
    else
      errors.add(:start_date, 'start_date needs to be specified')
    end

    if(self.paid?)
      errors.add(:country, 'need to know which country you are from') unless self.country
      errors.add(:contact, 'need to know how to contact you') unless self.contact
    end
  end

  enum status: [:unpaid, :paid, :confirmed]
  validates :purchasable, :driver, :vehicle, :price, :email, :contact, :country, presence: true
end
