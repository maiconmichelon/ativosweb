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
    @maintenance = Maintenance.create(maintenance_params)
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
    begin
      commit = params[:commit]
      @de = Date.parse(params[:de])
      @ate = Date.parse(params[:ate])
      
      if commit.eql? I18n.t('maintenances.group_by_period.monthly')
        @maintenances = @company.maintenances.where(date: @de..@ate).group_by_month(:date, format: '%m %d %Y').count
      else
        @maintenances = @company.maintenances.where(date: @de..@ate).group_by_day(:date, format: '%m %d %Y').count
      end
    rescue StandardError => error
    end
  end

  private
    def set_maintenance
      @maintenance = @company.maintenances.find(params[:id])
    end

    def maintenance_params
      params.require(:maintenance).permit(:description, :date, :value, :person_id, :fixture_id, budget_maintenances_attributes: [:maintenance_id, :budget_id])
    end

end
