class DriversController < ApplicationController
  before_filter(only:[:show]){@driver = Driver.find(params[:id])}

  def index
    @drivers = Driver.all
  end

  def show
  end
end
