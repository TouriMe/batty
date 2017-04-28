# Load the Rails application.
require File.expand_path('../application', __FILE__)


# ActionMailer::Base.smtp_settings = {
#   :address        => 'smtp-relay.sendinblue.com',
#   :port           => '587',
#   :authentication => :plain,
#   :user_name      => 'support@tourime.com',
#   :password       => 'pWG0zPv9yFMSKIJC',
#   :domain         => 'staging.tourime.com',
#   :enable_starttls_auto => true
# }
ActionMailer::Base.smtp_settings = {
   address:               "email-smtp.us-east-1.amazonaws.com",
   authentication:        :login,
   user_name:             "support@tourime.com",
   password:              "pWG0zPv9yFMSKIJC",
   enable_starttls_auto:  true,
   port:                  587,
   openssl_verify_mode:   OpenSSL::SSL::VERIFY_NONE,
   domain:                "tourime.com",
   ssl:                   true,
   tls:                   true
}

# Initialize the Rails application.
Rails.application.initialize!
