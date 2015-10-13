class Purchase < ActiveRecord::Base
  belongs_to :tourist
  belongs_to :purchasable, polymorphic: true

  enum status: [:unpaid, :paid, :confirmed]
end
