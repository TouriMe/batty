class DriversController < ApplicationController
  before_filter(only:[:show, :add_comment]){
    @driver = Driver.friendly.find(params[:id])}

  def index
    @drivers = Driver.active
  end

  def show
    @dirver = Driver.friendly.find(params[:id])
  end

  def find_drivers
    @drivers = Driver.active
    #city_id = params['city_id']
    #if city_id.empty?
      #@drivers = Driver.active
    #else
      #@drivers = City.find(city_id).drivers.active
    #end

    render 'index'
  end

  def add_comment
    comment_params = params.require(:comment).permit(:message, :rating)
    comment = @driver.comments.new comment_params
    comment.normal_user = current_normal_user

    if(comment.save)
      flash[:notice] = 'Comment Added.'
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
