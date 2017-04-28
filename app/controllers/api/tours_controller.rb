module Api
  class ToursController < ApiController
    def index
      if params[:tour_type] == '0'
        activity = Activity.find(params[:activity_type]) 
        @tour_results = activity.tours.where(is_active: true)
      else
        activity = Activity.find(params[:activity_type])
        @tour_results = activity.tours.where(tour_type_id: params[:tour_type]).where(is_active: true)
      end
      render json: @tour_results
    end
  end
end
