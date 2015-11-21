class OrderConfirmation < ApplicationMailer
  default from: 'order@tourime.com'

  def confirm(purchase)
    @purchase = purchase
    puts 'purchase created.'
    mail(to: @purchase.email, subject: 'Your Order with TouriMe has been confirmed')
  end
end
