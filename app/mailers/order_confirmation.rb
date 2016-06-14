require 'sendinblue'
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
    m = Sendinblue::Mailin.new("https://api.sendinblue.com/v2.0","pWG0zPv9yFMSKIJC",5)
    data = { "to" => {@purchase.email=>"to whom!"},
             "from" => ["support@tourime.com","from email!"],
             "subject" => "Your Booking with TouriMe has been confirmed"
    }
    result = m.send_email(data)
    puts 'purchase created.'
  end
end
