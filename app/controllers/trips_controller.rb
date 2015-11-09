class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.friendly.find(params[:id])

    # @trip = Trip.find(params[:id])
    @purchase = @trip.purchases.new
    @purchase.price = @trip.price
  end
end
