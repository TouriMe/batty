class ToursController < ApplicationController
  before_filter(only: :show) { @no_show_title = true }

  def index
    # if normal_user_signed_in? && !current_normal_user.nil?  && current_normal_user.internal_user?
    #   @tours = Tour.all.order(:is_active).reverse_order
    # else
    #   @tours = Tour.where(is_active: true).all
    # end
    @activities = Activity.all
    @seotags = Seo.find_by_page('tour_listing')
    # @custom_title = 'Experiences'
    # @custom_subtitle = 'Unique, authentic, and flexible experiences to travel like a local'
  end

  def show
    @tour = Tour.includes(:images).friendly.find(params[:id])
    @vehicle_type = 'remork/tuk tuk'
    if @tour.tuktuk_price_cents == 0
      @vehicle_type = 'car'
    end
    @seotags = Seo.new(@tour.seo_tags)
    @drivers = @tour.available_drivers
    @review = Review.new
    @review_by_date = Review.sort_by_date.where(review_type: 'tour', name: @tour.name)
    @review_by_stars = Review.sort_by_star.where(review_type: 'tour', name: @tour.name)
    @tour_purchased_records = Purchase.where(purchasable_id: @tour.id)
    # @tour_drivers = @tour.available_drivers.page(params[:page]).per(10)
  end

  def driver_selection
    @tour = Tour.find(params[:tour_id])
    @drivers = @tour.drivers.all
  end
end
