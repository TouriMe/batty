class TripsController < ApplicationController
  before_filter(only: :show){ @no_show_title = true }

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
