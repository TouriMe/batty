class OrderConfirmation < ApplicationMailer
  default from: 'support@tourime.com'

  def confirm(purchase)
    @purchase = purchase
    if @purchase.purchasable.tuktuk_price.to_i > 0
      @charge = @purchase.purchasable.tuktuk_price.to_i + @purchase.purchasable.ticket_price_cents.to_i
    else
      @charge = @purchase.purchasable.car_price.to_i + @purchase.purchasable.ticket_price_cents.to_i
    end
    puts 'purchase created.'
    mail(to: @purchase.email, subject: 'Your Booking with TouriMe has been confirmed')
  end
end
