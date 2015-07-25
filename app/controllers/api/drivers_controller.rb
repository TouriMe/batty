class Api::DriversController < ApiController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
    render '_model'
  end
end
