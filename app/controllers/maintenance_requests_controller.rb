class MaintenanceRequestsController < RequestsController
  before_action :set_maintenance_request, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @maintenance_requests = @company.maintenance_requests
    respond_with(@maintenance_requests)
  end

  def show
    respond_with(@maintenance_request)
  end

  def new
    @maintenance_request = @company.maintenance_requests.new(responsible: current_user)
    respond_with(@maintenance_request)
  end

  def edit
  end

  def create
    @maintenance_request = @company.maintenance_requests.create(maintenance_request_params)
    @maintenance_request.responsible = current_user
    @maintenance_request.save
    respond_with(@company, @maintenance_request)
  end

  def update
    @maintenance_request.update(maintenance_request_params)
    respond_with(@company, @maintenance_request)
  end

  def destroy
    @maintenance_request.destroy
    respond_with(@company, @maintenance_request)
  end

  private
    def set_maintenance_request
      @maintenance_request = @company.maintenance_requests.find(params[:id])
    end

    def maintenance_request_params
      permit params.require(:maintenance_request)
    end
end
