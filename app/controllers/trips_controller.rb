class TripsController < ApplicationController
  before_filter(only: :show) { @no_show_title = true }

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

    if @trip.tuktuk_price.to_i == 0
      @drivers = Driver.includes(:vehicles).where('vehicles.name = ?', 'Car').references(:vehicles).where(is_active: true).page(params[:page]).per(10)
    else
      @drivers = Driver.where(is_active: true).page(params[:page]).per(10)
    end

    @seotags = Seo.new()
    @seotags.title = @trip.name + '-' + @trip.description
    @seotags.description = @trip.name + '-' + @trip.description
    @seotags.keywords = @trip.name + ' - Distance ' + @trip.distance.to_s + 'km, Duration ' + @trip.duration.to_s + ', ' + @trip.checkpoint_num.to_s + ' Checkpoints potential visit, Start at ' + @trip.tour_start + ', End at ' + @trip.tour_end  + ', Price by Remork (tuk tuk)' + @trip.tuktuk_price.to_i.to_s + ' USD, by Car ' + @trip.car_price.to_i.to_s + ' USD'
  end

  def drivers

  end

end
