class Api::DriversController < ApiController
  def index
    @drivers = Driver.all
  end

  def view
  end
end
