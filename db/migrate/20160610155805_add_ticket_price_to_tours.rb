class AddTicketPriceToTours < ActiveRecord::Migration
  def change
    add_column :tours, :ticket_price, :integer
  end
end
