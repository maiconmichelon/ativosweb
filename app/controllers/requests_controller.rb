class RequestsController < ApplicationController
  include RequestsHelper

  before_action :set_request, only: [:approve_request, :reprove_request, :back_to_pending]

  def approve_request
    if (able_to_approve_reprove? @request)
      @request.budget_approved = @request.budgets.where(id: params[:budget_ids]).first
      @request.approved!
    end
    respond_with(@company, location: company_fixtures_path(@company))
  end

  def reprove_request
    @request.rejected! if (able_to_approve_reprove? @request)
    respond_with(@company, location: company_fixtures_path(@company))
  end

  def back_to_pending
    if @request.approval_responsible.eql?(current_user)
      @request.budget_approved = nil
      @request.pending!
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

  def search_params
    return nil unless params[:search]
    params.require(:search).permit(:title, :date, :responsible_id, :description, :status, :fixture_id)
  end

end
