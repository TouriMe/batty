class AddTicketPriceCurrencyToTours < ActiveRecord::Migration
  def change
    add_column :tours, :ticket_price_currency, :string
  end
end
