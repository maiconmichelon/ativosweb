class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]

  def index
    @maintenances = @company.maintenances
    respond_with(@maintenances)
  end

  def edit
    respond_with(@maintenance)
  end

  def update
    @maintenance.update(maintenance_params)
    respond_with(@company, @maintenance)
  end

  def new
    @maintenance = @company.maintenances.new
    respond_with(@maintenance)
  end

  def create
    @maintenance = @company.maintenances.create(maintenance_params)
    respond_with(@company, @maintenance)
  end

  def show
    respond_with(@maintenance)
  end

  def destroy
    @maintenance.destroy
    respond_with(nil, location: company_maintenances_path)
  end

  def group_by_period
    @maintenances = @company.maintenances.group(:date).count
  end

  private
    def set_maintenance
      @maintenance = @company.maintenances.find(params[:id])
    end

    def maintenance_params
      params.require(:maintenance).permit(:description, :date, :value, :person_id, :fixture_id, budget_maintenances_attributes: [:maintenance_id, :budget_id])
    end

end
