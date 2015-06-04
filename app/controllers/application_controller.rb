class ApplicationController < ActionController::Base
  before_action :set_company
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
  def current_company
    company_id = params[:company_id] ? params[:company_id] : params[:id]
    Company.find(company_id) if company_id
  end

  private
    def set_company
      @company = current_company
    end
end
