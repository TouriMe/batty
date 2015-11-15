class PurchasesController < ApplicationController
  before_action(except: :create) { @purchase = Purchase.find(params[:id])}

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.status = 'unpaid'
    if @purchase.vehicle.name == 'Car'
      @purchase.price = @purchase.purchasable.car_price
    else
      @purchase.price = @purchase.purchasable.tuktuk_price
    end
    @purchase.tourist = current_normal_user if current_normal_user

    respond_to do |f|
      f.js do
        if @purchase.save
          render js: "window.location = '#{edit_purchase_path(@purchase)}'"
        else
          render
        end
      end

      f.html do
        if @purchase.save
          redirect_to edit_purchase_path(@purchase)
        else
          redirect_to :back, error: "Error in your input: #{@purchase.errors.messages}"
        end
      end
    end
  end

  def edit
    if @purchase.status == :paid
      redirect_to request.referer
      flash[:error] = 'The purchase you request has already been paid'
    end
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
  def purchase_params
    params.require(:purchase).permit(:purchasable_id, :purchasable_type, :start_date, :email, :driver_id,
                                     :vehicle_id, :country, :contact, :comments)
  end
end
