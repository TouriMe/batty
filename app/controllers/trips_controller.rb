class TripsController < ApplicationController
  before_filter(only: :show){ @no_show_title = true }

  def index
    @trips = Trip.all
  end


  # book the tour(:tour_id)
  # with driver (:driver_id)
  def book
    @driver = Driver.find(params[:driver_id])
    @trip   = Trip.find(params[:trip_id]) 

    return render json: @driver
  end
 

  def show
    @trip = Trip.find(params[:id])
 
    if (@trip.down_payment) && (@trip.booking_fee)
      @f_pay = @trip.down_payment + @trip.booking_fee
    else 
      @f_pay = @trip.tuktuk_price
    end
   
    @drivers = Driver.all
    @page_title = @trip.name
  end

end
