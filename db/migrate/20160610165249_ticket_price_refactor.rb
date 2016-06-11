class TicketPriceRefactor < ActiveRecord::Migration
  def change
    remove_column :tours, :ticket_price
    remove_column :tours, :ticket_price_currency
    add_monetize :tours, :ticket_price
  end
end
