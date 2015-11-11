class TourPriceRefactor < ActiveRecord::Migration
  def change
    rename_column :trips, :price_cents, :tuktuk_price_cents
    rename_column :trips, :price_currency, :tuktuk_price_currency

    add_monetize :trips, :car_price
  end
end
