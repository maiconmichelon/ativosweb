class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  respond_to :html, :json
  responders :flash
  
  before_action do
    I18n.locale = params[:locale]
  end

  def default_url_options
    { locale: I18n.locale }
  end

end
