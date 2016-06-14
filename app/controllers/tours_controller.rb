class ToursController < ApplicationController
  before_filter(only: :show) { @no_show_title = true }

  def index
    if normal_user_signed_in? && !current_normal_user.nil?  && current_normal_user.internal_user?
      @tours = Tour.all.order(:is_active).reverse_order
    else
      @tours = Tour.where(is_active: true).all
    end

    @seotags = Seo.find_by_page('tour_listing')
    @custom_title = 'Experiences'
    @custom_subtitle = 'Unique, authentic, and flexible experiences to travel like a local'
  end

  def show
    @tour = Tour.includes(:images).find(params[:id])
    @vehicle_type = 'remork/tuk tuk'
    if @tour.tuktuk_price_cents == 0
      @vehicle_type = 'car'
    end
    @seotags = Seo.new(@tour.seo_tags)
    @tour_drivers = @tour.drivers.page(params[:page]).per(10)
  end

end
