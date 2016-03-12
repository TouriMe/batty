class ToursController < ApplicationController
  before_filter(only: :show) { @no_show_title = true }

  def index
    @tours = Tour.where(is_active: true).all
    @seotags = Seo.find_by_page('tour_listing')
    @custom_title = 'Tours'
    @custom_subtitle = 'Handpicked local tours, adventures and activities guided by driver.'
  end

  def show
    @tour = Tour.includes(:images).find(params[:id])
    @seotags = Seo.new(@tour.seo_tags)
    @tour_drivers = @tour.drivers.page(params[:page]).per(10)
  end

end
