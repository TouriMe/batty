class ReviewsController < ApplicationController

  def new
  end

  def create
    @review = Review.new(permit_params)
    if @review.save
      flash.notice = "Your review is submitted."
      redirect_to :back
    end    
  end

  private 

  def permit_params
    params.require(:review).permit(:review, :star, :name, :review_type, :email, :customer_name)
  end
end
