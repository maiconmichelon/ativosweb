class RequestsController < ApplicationController
  
  protected
    def permit(obj)
      obj.permit(:title, :date, :description, :responsible_id, :fixture_id, :approval_responsible_id,
        budgets_attributes: [:id, :_destroy, :value, :description, :provider_id, :date])
    end
end
