class DriverCommentsController < ApplicationController
  before_action {@driver = Driver.find(params[:driver_id])}

  def create
    flash[:success] = 'Message Created'
    @driver.driver_comments.new :message
  end

  private
  def comment_params
    params.require(:driver_comment).permit(:message)
  end
end
