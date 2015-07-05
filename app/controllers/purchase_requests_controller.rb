class PurchaseRequestsController < RequestsController
  before_action :set_purchase_request, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @purchase_requests = @company.purchase_requests.page(params[:page])
    respond_with(@purchase_requests)
  end

  def show
    respond_with(@purchase_request)
  end

  def new
    @purchase_request = @company.purchase_requests.new(responsible: current_user)
    respond_with(@purchase_request)
  end

  def edit
  end

  def create
    @purchase_request = @company.purchase_requests.create(purchase_request_params)
    @purchase_request.responsible = current_user
    @purchase_request.save
    respond_with(@company, @purchase_request)
  end

  def update
    @purchase_request.update(purchase_request_params)
    respond_with(@company, @purchase_request)
  end

  def destroy
    @purchase_request.destroy
    redirect_to action: :index
  end

  private
    def set_purchase_request
      @purchase_request = @company.purchase_requests.find(params[:id])
    end

    def purchase_request_params
      permit params.require(:purchase_request)
    end
end
