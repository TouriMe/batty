class DriversController < ApplicationController
  before_filter(only: [:show, :add_comment]) { @no_show_title = true }

  def index
    @drivers = Driver.active
    @seotags = Seo.find_by_page('driver_listing')
    @custom_title = 'Hosts'
    @custom_subtitle = 'Trained and certified onsite hosts to offer premium service.'
  end

  def show
    @driver = Driver.friendly.find(params[:id])
    @seotags = Seo.new(@driver.seo_tags)
  end

  def find_drivers
    @drivers = Driver.active
    render 'index'
  end

  def add_comment
    @driver = Driver.find(params[:id])
    comment_params = params.require(:comment).permit(:message, :rating)
    comment = @driver.comments.new comment_params
    comment.normal_user = current_normal_user

    if comment.save
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
