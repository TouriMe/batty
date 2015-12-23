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
    @purchase.save

    if @purchase.save
      render json: @purchase
    else
      render json: {"message" => "Not succcess"}
    end
  end


  # book the tour(:tour_id)
  # with driver (:driver_id) 
  def new
    @vehicle_type = params[:vehicle_type]
    @trip = Trip.friendly.find(params[:tour_id])
    @driver = Driver.friendly.find(params[:driver_id])
    @purchase = Purchase.new
    @no_show_title = true

    @charge = 0
    if @trip.down_payment
      @charge += @trip.down_payment
    end
    if @trip.booking_fee
      @charge += @trip.booking_fee
    end

    if @vehicle_type == "Tuk Tuk"
      @later_pay = (@trip.tuktuk_price_cents/100) + @trip.booking_fee - @charge
      @driver.vehicles.each do |v|
        if v.name.downcase == "tuk tuk"
          @vehicle_id = v.id
        end
      end
    elsif @vehicle_type == "Car"
      @later_pay = (@trip.car_price_cents/100) + @trip.booking_fee - @charge
      @driver.vehicles.each do |v|
        if v.name.downcase == "Car"
          @vehicle_id = v.id
        end
      end
    end
    @braintree_key = Braintree::ClientToken.generate
  end


  # checkout that previous purchase
  def checkout
    @nonce = params[:payment_method_nonce]
    @purchase = Purchase.find(params[:id])
    @trip = Trip.find(@purchase.purchasable_id)

    if @trip.down_payment && @trip.booking_fee
      @charge = @trip.down_payment + @trip.booking_fee
    else
      @charge = 0
    end

    if (@charge > 0)
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
        redirect_to payment_success_path
      end
    end
  end

  def edit
    if @purchase.status == :paid
      redirect_to request.referer
      flash[:error] = 'The purchase you request has already been paid'
    end
  end

  def success
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
    params.require(:purchase).permit(:purchasable_id, :purchasable_type, :start_date, :email,
                                     :email_confirmation, :country_code, :phone_number, :comments, :driver_id, :vehicle_id)
  end

  def purchase_params
    params.require(:purchase).permit(:purchasable_id, :purchasable_type, :start_date, :email, :driver_id,
                                     :vehicle_id, :country, :email_confirmation, :country_code, :phone_number, :contact, :comments)
  end

end

