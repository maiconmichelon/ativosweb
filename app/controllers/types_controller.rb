class TypesController < ApplicationController
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def index
    @types = @company.types
    respond_with(@types)
  end

  def show
    respond_with(@type)
  end

  def new
    @type = @company.types.new
    respond_with(@type)
  end

  def edit
    respond_with(@type)
  end

  def create
    @type = @company.types.create(type_params)
    respond_with(@company, @type)
  end

  def update
    @type.update(type_params)
    respond_with(@company, @type)
  end

  def destroy
    @type.destroy
    respond_with(nil, types_path)
  end

  private
    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params[:type].permit(:description, :initial_code, :company_id, type_components_attributes: [:type_id, :component_id])
    end

end
