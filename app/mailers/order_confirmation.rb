class OrderConfirmation < ApplicationMailer
  default from: 'support@tourime.com'

  def confirm(purchase, hostName)
    @purchase = purchase
    @domainName = hostName
    puts 'purchase created.'
    mail(to: @purchase.email, subject: 'Your Booking with TouriMe has been confirmed')
  end
end
