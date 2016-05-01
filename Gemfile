source 'https://rubygems.org'
ruby '2.1.5'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'populator' # used to populate database with fake data
  gem 'faker' # used to populate database with fake data
end

group :development, :test do
  gem 'thin'
end

group :test do 
  gem 'rubocop', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

gem 'responders'
gem 'show_for'
gem 'email_validator'
gem 'date_validator'

gem 'omniauth-google-oauth2'

gem 'bootstrap-sass', '~> 3.3.4'
gem 'sass-rails', '>= 3.2'

gem 'rails', '4.1.0'
gem 'spring', group: :development
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'high_voltage'
gem 'pg'
gem 'simple_form'
gem 'slim-rails'
gem 'therubyracer', :platform=>:ruby
gem 'sprockets-rails'
gem 'draper' # Gems to help with Presenters
gem 'cocoon' # For build forms with nested attributes
gem "bcrypt-ruby", :require => 'bcrypt' # For login
gem 'devise'
gem 'gravtastic'
gem 'font-awesome-rails'
gem 'font-kit-rails'
gem 'chartkick' # reports
gem 'groupdate' # used to generate reports grouped by date
gem 'bootstrap-datepicker-rails'
gem 'kaminari', git: 'https://github.com/amatsuda/kaminari.git' # paginator