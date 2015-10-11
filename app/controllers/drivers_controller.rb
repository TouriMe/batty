class DriversController < ApplicationController
  before_filter(only:[:show, :add_comment]){@driver = Driver.find(params[:id])}

  def index
    @drivers = Driver.active
  end

  def show
  end

  def find_drivers
    city_id = params['city_id']
    if city_id.empty?
      @drivers = Driver.active
    else
      @drivers = City.find(city_id).drivers.active
    end

    render 'index'
  end

  def add_comment
    comment_params = params.require(:driver_comment).permit(:message, :rating)
    comment = @driver.driver_comments.new comment_params
    comment.normal_user = current_normal_user

    if(comment.save)
      flash[:success] = 'Comment Added.'
      redirect_to driver_path(@driver)+'#comment-section'
      return
    else
      puts "Comment Error: #{comment.errors.to_a.join(', ')}"
      flash[:error] = 'Error: ' + comment.errors.to_a.join(', ')
    end

    @driver.reload

    render 'show'
  end
end
