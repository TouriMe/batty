# Load the Rails application.
require File.expand_path('../application', __FILE__)


ActionMailer::Base.smtp_settings = {
  :address        => 'smtp-relay.sendinblue.com',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'support@tourime.com',
  :password       => 'pWG0zPv9yFMSKIJC',
  :domain         => 'staging.tourime.com',
  :enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!
