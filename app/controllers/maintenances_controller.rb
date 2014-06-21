class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]

  def index
    @maintenances = Maintenance.all
    respond_with(@maintenances)
  end

  def edit
    respond_with(@maintenance)
  end

  def update
    @maintenance.update(maintenance_params)
    respond_with(@maintenance, location: @maintenance)
  end

  def new
    @maintenance = Maintenance.new
    respond_with(@maintenance)
  end

  def create
    @maintenance = Maintenance.create(maintenance_params)
    respond_with(@maintenance, location: @maintenance)
  end

  def show
    respond_with(@maintenance)
  end

  def destroy
    @maintenance.destroy
    respond_with(nil, location: maintenances_path)
  end

  private
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    def maintenance_params
      params.require(:maintenance).permit(:description, :date, :value, :person_id, budget_maintenances_attributes: [:maintenance_id, :budget_id])
    end

end
