class ApplicationController < ActionController::Base
  respond_to :html
  protect_from_forgery with: :exception

  helper_method :current_user, :current_company

  before_action do
    I18n.locale = params[:locale]
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_company
    Company.find(params[:company_id]) if params[:company_id]
  end

end
