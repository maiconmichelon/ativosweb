class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_locale

  before_action :set_company
  respond_to :html
  protect_from_forgery with: :exception

  helper_method :current_user, :current_company

  def default_url_options
    { locale: I18n.locale }
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :full_name
    devise_parameter_sanitizer.for(:account_update) << :full_name
  end

private
  def set_locale
    I18n.locale = params[:locale] || "pt-BR"
  end

  def current_company
    company_id = params[:company_id] ? params[:company_id] : params[:id]
    company_id ? Company.find(company_id).decorate : nil
  end

  def set_company
    @company = current_company
  end

end
