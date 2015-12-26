# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Action Mailer Send Grid Integration 
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'tourime',
  :password       => 'J577i73I',
  :domain         => 'staging.tourime.com',
  :enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!
