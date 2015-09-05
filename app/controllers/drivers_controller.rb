class DriversController < ApplicationController
  before_filter(only:[:show, :add_comment]){@driver = Driver.find(params[:id])}

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

  def add_comment
    comment_params = params.require(:driver_comment).permit(:message, :rating)
    comment = @driver.driver_comments.new comment_params
    comment.tourist = current_tourist

    if(comment.save)
      flash[:success] = 'Comment Added.'
    else
      flash[:error] = 'Error: ' + comment.errors.to_a.join(', ')
    end

    @driver.reload

    render 'show'
  end
end
