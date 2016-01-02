class BookingsController < ApplicationController
  
  #### the param will pass
  # reference_id and
  # use it to find 
  # purchase and pass it back to view 
  def show()
    @ref_id = params[:reference_id]
    @purchase = Purchase.find_by_reference_id(@ref_id)
    @no_show_title = true
  end
end
