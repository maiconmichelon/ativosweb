class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :edit, :update, :destroy]

  def index
    @components = Component.all
    respond_with(@components)
  end

  def show
    respond_with(@component)
  end

  def new
    @component = Component.new
    respond_with(@component)
  end

  def edit
    respond_with(@component)
  end

  def create
    @component = Component.create(component_params)
    respond_with(@component, location: @component)
  end

  def update
    @component.update(component_params)
    respond_with(@component, :location => @component)
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
