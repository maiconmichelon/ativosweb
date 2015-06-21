class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_action :set_company
  respond_to :html

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
  def current_company
    return nil if params[:controller].eql? 'users'
    company_id = params[:company_id] ? params[:company_id] : params[:id]
    company = company_id ? current_user.decorate.companies.find(company_id).decorate : nil
  end

  def set_company
    @company = current_company
  end

end
