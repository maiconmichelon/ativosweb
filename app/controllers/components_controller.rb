class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :edit, :update, :destroy]

  def index
    @components = @company.components.page(params[:page])
    respond_with(@components)
  end

  def show
    respond_with(@component)
  end

  def new
    @component = @company.components.new
    respond_with(@component)
  end

  def edit
  end

  def create
    @component = @company.components.create(component_params)
    respond_with(@company, @component)
  end

  def update
    @component.update(component_params)
    respond_with(@company, @component)
  end

  def destroy
    @component.destroy
    redirect_to action: :index
  end

  private
    def set_component
      @component = @company.components.find(params[:id])
    end

    def component_params
      params.require(:component).permit(:name, :company_id)
    end
end
