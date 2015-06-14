class RequestsController < ApplicationController
  
  protected
    def permit(obj)
      attrs = [:title, :date, :description, :fixture_id, budgets_attributes: [:id, :_destroy, :value, :provider_id, :date]]
      attrs << :approval_responsible_id unless params[:action] == :create

      obj.permit(attrs)
    end
end
