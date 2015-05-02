class TypesController < ApplicationController
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def index
    respond_with(current_company.types)
  end

  def show
    respond_with(@type)
  end

  def new
    @type = Type.new
    respond_with(@type)
  end

  def edit
    respond_with(@type)
  end

  def create
    @type = Type.create(type_params)
    respond_with(@type, location: @type)
  end

  def update
    @type.update(type_params)
    respond_with(@type, location: @type)
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
      params[:type].permit(:description, :initial_code)
    end

end
