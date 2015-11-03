class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    # a little tweak to make 
    # url readable
    @named_param = params[:name].gsub("-", " " )
    @trip = Trip.find_by_name(@named_param)

    # @trip = Trip.find(params[:id])
    @purchase = @trip.purchases.new
    @purchase.price = @trip.price
  end
end
