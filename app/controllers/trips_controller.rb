class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def add_comment
    comment = @trip.trip_comments.new comment_params
    comment.tourist = current_normal_user

    if(comment.save)
      flash[:success] = 'Comment Added.'
      redirect_to trip_path(@trip)+'#comment-section'
      return
    else
      puts "Comment Error: #{comment.errors.to_a.join(', ')}"
      flash[:error] = 'Error: ' + comment.errors.to_a.join(', ')
    end

    @trip.reload

    render 'show'
  end
end
