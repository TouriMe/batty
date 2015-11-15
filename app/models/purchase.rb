class Purchase < ActiveRecord::Base
  belongs_to :tourist
  belongs_to :purchasable, polymorphic: true
  belongs_to :driver
  belongs_to :vehicle

  before_create { self.status = :unpaid }

  validate do
    errors.add(:start_date, 'start_date needs to be specified') and next unless self.start_date
    errors.add(:start_date, 'start_date must be 1 day later') and next unless self.start_date > Time.now
  end

  enum status: [:unpaid, :paid, :confirmed]
  validates :price, :email, :purchasable, :driver, :vehicle, presence: true
end
