class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]

  def index
    @maintenances = Maintenance.all
  end

  def edit
    @maintenance = Maintenance.find(params[:id])
  end

  def update
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def new
    @maintenance = Maintenance.new
  end

  def create
    @maintenance = Maintenance.new(maintenance_params)

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
  end

  def destroy
    @maintenance.destroy
    redirect_to maintenances_url
  end

  private
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    def maintenance_params
      params.require(:maintenance).permit(:description)
    end

end
