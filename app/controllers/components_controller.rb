class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :edit, :update, :destroy]

  def index
    respond_with(current_company.components)
  end

  def show
    respond_with(@component)
  end

  def new
    @component = Component.new
    respond_with(@component)
  end

  def edit
  end

  def create
    @component = Component.create(component_params)
    respond_with(@component)
  end

  def update
    @component.update(component_params)
    respond_with(@component)
  end

  def destroy
    @component.destroy
    respond_with(nil, location: components_path)
  end

  private
    def set_component
      @component = Component.find(params[:id])
    end

    def component_params
      params.require(:component).permit(:name)
    end
end
