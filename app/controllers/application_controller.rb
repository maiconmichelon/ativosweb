class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_action :set_company
  respond_to :html

  helper_method :current_user, :current_company

  def default_url_options
    { locale: I18n.locale }
  end

  def search(elements, search_params)
    search_params.each do |key, value|
      elements = elements.send('by_' + key, value) unless value.empty?
    end

    elements
  end

  def index
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
    company = company_id ? current_user.decorate.company_by_id(company_id).decorate : nil
  end

  def set_company
    @company = current_company
  end

end
