class RequestsController < ApplicationController
  include RequestsHelper

  before_action :set_request, only: [:approve_request, :reprove_request]

  def approve_request
    if (able_to_approve_reprove? @request)
      @request.approved!
      @request.save
    end
    respond_with(@company, location: company_fixtures_path(@company))
  end

  def reprove_request
    if (able_to_approve_reprove? @request)
      @request.rejected!
      @request.save
    end
    respond_with(@company, location: company_fixtures_path(@company))
  end

protected
  def set_request
    @request = @company.requests.find(params[:request_id])
  end

  def permit(obj)
    attrs = [:title, :date, :description, :fixture_id, budgets_attributes: [:id, :_destroy, :value, :provider_id, :date]]
    attrs << :approval_responsible_id unless params[:action] == :create

    obj.permit(attrs)
  end
end
