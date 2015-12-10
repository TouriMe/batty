class TripsController < ApplicationController
  before_filter(only: :show){ @no_show_title = true }

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
 
    if (@trip.down_payment) && (@trip.booking_fee)
      @f_pay = @trip.down_payment + @trip.booking_fee
    else 
      @f_pay = @trip.tuktuk_price
    end
    
    @page_title = @trip.name
  end

end
