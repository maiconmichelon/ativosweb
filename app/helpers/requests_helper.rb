module RequestsHelper

  def maintenance_request?(request)
    request.type.eql? 'MaintenanceRequest'
  end

  def path(request)
    return maintenance_request?(request) ? company_maintenance_requests_path : company_purchase_requests_path
  end

  def edit_path(company, request)
    return maintenance_request?(request) ? edit_company_maintenance_request_path(@company, request) : 
          edit_company_purchase_request_path(@company, request)
  end

  def able_to_approve_reprove?(request)
    @request.approval_responsible.eql?(current_user) && @request.pending?
  end

end