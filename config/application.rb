require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Ativos
  class Application < Rails::Application
    # Set Time.zone default to the specified zone
    # and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of
    # tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Brasilia'
    # config.active_record.default_timezone = 'Brasilia'

    # The default locale is :en and all
    # translations from config/locales/*.rb,yml are auto loaded.
    # Rails.application.config.i18n.load_path
    # += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :"pt-BR"

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => 'www.controleativos.com',
      :password             => 'controleativos1234',
      :user_name            => 'controleativos',
      :authentication       => 'plain',
      :enable_starttls_auto => true 
    }
    # Para debug apenas, é melhor que a linha abaixo seja adicionado apenas no ambiente de desenvolvimento
    config.action_mailer.raise_delivery_errors = true
  end
end
