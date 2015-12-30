class TripsController < ApplicationController
  before_filter(only: :show){ @no_show_title = true }

  def index
    @trips = Trip.where(is_active: true).all
    @seotags = Seo.find_by_page('tour_listing')
  end

  def show
    @trip = Trip.find(params[:id])
 
    if (@trip.down_payment) && (@trip.booking_fee)
      @f_pay = @trip.down_payment + @trip.booking_fee
    else 
      @f_pay = @trip.tuktuk_price
    end
    
    @drivers = Driver.where(is_active: true).page(params[:page]).per(10)
    @seotags = Seo.find_by_page(@trip.name)

  end

  def drivers

  end

end
