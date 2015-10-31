class Purchase < ActiveRecord::Base
  belongs_to :tourist
  belongs_to :purchasable, polymorphic: true
  belongs_to :driver
  belongs_to :vehicle

  before_create { self.status = :unpaid }

  validate do
    errors.add(:start_date, 'start_date needs to be specified') unless self.start_date
    errors.add(:start_date, 'start_date must be 1 day later') unless self.start_date > Time.now

    if(self.paid?)
      errors.add(:country, 'need to know which country you are from') unless self.country
      errors.add(:contact, 'need to know how to contact you') unless self.contact
    end
  end

  enum status: [:unpaid, :paid, :confirmed]
  validates :price, :email, :purchasable, :driver, :vehicle, presence: true
end
