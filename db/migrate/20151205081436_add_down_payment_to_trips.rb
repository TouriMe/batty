class AddDownPaymentToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :down_payment , :decimal
    add_column :trips, :down_payment_currency, :string
    add_column :trips, :booking_fee, :decimal
    add_column :trips, :booking_fee_currency, :string
  end
end
