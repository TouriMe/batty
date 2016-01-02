class ToursController < ApplicationController
  before_filter(only: :show) { @no_show_title = true }

  def index
    @tours = Tour.where(is_active: true).all
    @seotags = Seo.find_by_page('tour_listing')
  end

  def show
    @tour = Tour.find(params[:id])

    if (@tour.down_payment) && (@tour.booking_fee)
      @f_pay = @tour.down_payment + @tour.booking_fee
    else
      @f_pay = @tour.tuktuk_price
    end

    if @tour.tuktuk_price.to_i == 0
      @drivers_query = Driver.includes(:vehicles).where('vehicles.name = ?', 'Car').references(:vehicles).where(is_active: true).page(params[:page]).per(10)
    else
      @drivers_query = Driver.where(is_active: true).page(params[:page]).per(10)
    end
    
    @drivers = @drivers_query.page(params[:page]).per(10)

    @seotags = Seo.new()
    @seotags.title = @tour.name + '-' + @tour.description
    @seotags.description = @tour.name + '-' + @tour.description
    @seotags.keywords = @tour.name + ' - Distance ' + @tour.distance.to_s + 'km, Duration ' + @tour.duration.to_s + ', ' + @tour.checkpoint_num.to_s + ' Checkpoints potential visit, Start at ' + @tour.tour_start + ', End at ' + @tour.tour_end  + ', Price by Remork (tuk tuk)' + @tour.tuktuk_price.to_i.to_s + ' USD, by Car ' + @tour.car_price.to_i.to_s + ' USD'
  end

  def drivers

  end

end
