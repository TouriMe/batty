class OrderConfirmation < ApplicationMailer
  default from: 'support@tourime.com'

  def confirm(purchase, hostname)
    @purchase = purchase
    @hostname = hostname
    puts 'purchase created.'
    mail(to: @purchase.email, Bcc:'yanghl22@gmail.com', subject: 'Your Booking with TouriMe has been confirmed')
  end
end
