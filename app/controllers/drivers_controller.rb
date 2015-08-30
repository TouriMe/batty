class DriversController < ApplicationController
  before_filter(only:[:show]){@driver = Driver.find(params[:id])}

  def index
    @drivers = Driver.all
  end

  def show
  end

  def find_drivers
    city_id = params['city_id']
    if city_id.empty?
      @drivers = Driver.all
    else
      @drivers = City.find(city_id).drivers
    end

    render 'index'
  end
end
