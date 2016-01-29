source 'https://rubygems.org'

gem 'rails', '4.2.2'

## DATABASE ACCESS ##
gem 'pg'

## ASSET PIPELINE ##
gem 'uglifier', '>= 1.3.0'
gem 'slim-rails'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'wysiwyg-rails'
gem 'rails_serve_static_assets'

## FRONTEND ##
gem 'react-rails', '~> 1.4.0'
gem 'foundation-rails', '~> 5.5.0'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-infinite-pages'
gem 'jquery-dotdotdot-rails', '~> 1.6', '>= 1.6.5'
gem 'social-share-button', '~> 0.1.6'

## TRANSLATION ##
gem 'i18n-js'
gem 'language_list'

## ROUTE HELPER ##
gem 'babosa'
gem 'friendly_id', '~> 5.1.0'

## VIEW HELPER ##
gem 'ckeditor'
gem 'kaminari'
gem 'dynamic_sitemaps'

## ACTIVERECORD HELPER ##
gem 'ransack'
gem 'money-rails'
gem 'obfuscate_id'

## ActiveSkin ##
gem 'active_skin'
gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_editor', github: 'boontdustie/active_admin_editor'

## AUTHORIZATION ##
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

## SERIALIZER ##
gem 'jbuilder', '~> 2.0'
gem 'active_model_serializers'

## IMAGE HANDLER ##
gem 'fog', require: 'fog/aws'
gem 'rmagick'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'

## EXTERNAL SERVICES ##
gem 'braintree'

## DOCUMENTATION ##
gem 'sdoc', '~> 0.4.0', group: :doc

## PRODUCTION STACK ##
group :production do
  gem 'rails_12factor'
end

## DEVELOPMENT STACK ##
group :development do
  gem 'annotate'
  gem 'rails-erd'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'web-console', '~> 3.0'
  gem 'rubocop', '~> 0.32.1', require: false
  gem 'rubocop-git', require: false
end

group :development, :test do
  gem 'faker'
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'pry-byebug'
end

## TEST STACK ##
group :test do
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'timecop'
  gem 'factory_girl_rails'
  gem 'test_after_commit', require: false
end
