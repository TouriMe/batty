class Purchase < ActiveRecord::Base
  belongs_to :tourist
  belongs_to :purchasable, polymorphic: true

  before_create { self.status = :unpaid }

  validate do
    errors.add(:start_date, 'start_date needs to be specified') and next unless self.start_date
    errors.add(:start_date, 'start_date must be 1 day later') and next unless self.start_date > Time.now
  end

  enum status: [:unpaid, :paid, :confirmed]
  validate :price, :email, presence: true
end
