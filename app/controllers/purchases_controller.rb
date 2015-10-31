class PurchasesController < ApplicationController
  before_action(except: :create) { @purchase = Purchase.find(params[:id])}

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.status = 'unpaid'
    @purchase.price = @purchase.purchasable.price
    # @purchase.tourist = current_normal_user if current_normal_user

    respond_to do |f|
      f.js do
        if @purchase.save
          render 'purchases/create_success.js.erb'
        else
          render 'purchases/form_error.js.erb'
        end
      end
    end
  end

  def edit
    if @purchase.status == :paid
      redirect_to request.referer
    end
  end

  def update
    nonce = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
        :amount => @purchase.purchasable.price,
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
    params.require(:purchase).permit(:purchasable_id, :purchasable_type, :start_date, :email)
  end
end
