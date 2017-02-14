class PurchasesController < ApplicationController
  ####################
  # refactoring needed
  #
  #
  ####

  # Create a purchase record 
  # before making a transcations 
  def create()
    @purchase = Purchase.new(ajax_params)
    @host = request.host
    @purchase.save
    if @purchase.save
      # render json: @purchase
      OrderConfirmation.confirm(@purchase,@host).deliver_now
      redirect_to payment_success_path(purchaseid: @purchase)
    else
      # render json: {"message" => "Not succcess"}
      redirect_to :back
    end
  end

  # book the tour(:tour_id)
  # with driver (:driver_id) 
  def new
    @vehicle_type = params[:vehicle_type]
    @trip = Tour.friendly.find(params[:tour_id])
    # @driver = Driver.friendly.find(params[:driver_id])
    @transport_price = @trip.tuktuk_price.to_i
    if @transport_price == 0
      @transport_price = @trip.car_price.to_i
    end
    @ticket_price = @trip.ticket_price_cents
    @purchase = Purchase.new
    @no_show_title = true

    ## Reference ID
    # todo \
    # format this to 5 chars
    # [A-Z][0-9][0-9][0-9][A-Z]
    @reference_id = SecureRandom.hex(7) # we will release this logic after 9 Millions purchases

    if @vehicle_type.downcase == 'remork/tuk tuk'
      @online_pay = @trip.tuktuk_price.to_i + @trip.ticket_price_cents.to_i
    elsif @vehicle_type == "car"
      @online_pay = @trip.car_price.to_i + @trip.ticket_price_cents.to_i
    end
    # @braintree_key = Braintree::ClientToken.generate
  end


  # checkout that previous purchase
  def checkout
    @nonce = params[:payment_method_nonce]
    @purchase = Purchase.find(params[:id])
    @trip = Tour.find(@purchase.purchasable_id)

    @charge = 0
    if @trip.tuktuk_price.to_i > 0
      @charge = @trip.tuktuk_price.to_i + @trip.ticket_price_cents.to_i
    else
      @charge = @trip.car_price.to_i + @trip.ticket_price_cents.to_i
    end

    if @charge > 0
      result = Braintree::Transaction.sale(
          :amount => @charge,
          :payment_method_nonce => @nonce,
          :options => {
              :submit_for_settlement => true
          }
      )
      if result
        @purchase.status = :paid
        @purchase.save
        redirect_to payment_success_path(purchaseid: @purchase)
      else

      end
    else
        redirect_to payment_success_path(purchaseid: @purchase)
    end
  end

  def edit
    if @purchase.status == :paid
      redirect_to request.referer
      flash[:error] = 'The purchase you request has already been paid'
    end
  end

  def success
    @trip = Purchase.find(params[:purchaseid]).purchasable
    @domain = request.host
    @custom_title = "Your payment has been successful"
  end

  def update
    @purchase.status = :paid

    unless @purchase.valid?
      render 'edit' and return
    end

    nonce = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
        :amount => @purchase.price,
        :payment_method_nonce => nonce
    )

    if result.success?
      @purchase.status = :paid
      @purchase.save
      flash[:notice] = 'Payment made successfully'
      render 'success'
    else
      flash[:error] = 'There is error with your payment: ' + result.message
      render 'edit'
    end
  end

  private
  def ajax_params # params that needed for an ajax create request
    params.require(:purchase).permit(:purchasable_id, :purchasable_type, :start_date, :email, :reference_id,
                                     :price, :address_id, :email_confirmation, :country_code, :phone_number,
                                     :comments, :driver_id, :vehicle_id, :pickup, :pickup_time, :traveller_number,
                                     :passport_number, :nationality, :first_name, :last_name, :latlng)
  end

  def purchase_params
    params.require(:purchase).permit(:purchasable_id, :purchasable_type, :start_date, :email, :driver_id, :reference_id,
                                     :address_id, :vehicle_id, :country, :email_confirmation, :country_code, :phone_number,
                                     :contact, :comments, :pickup, :pickup_time, :traveller_number, :passport_number,
                                     :nationality, :first_name, :last_name, :latlng)
  end

end

