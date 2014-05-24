class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  def index
    @providers = Provider.all
    respond_with(@providers)
  end

  def show
    respond_with(@provider)
  end

  def new
    @provider = Provider.new
    respond_with(@provider)
  end

  def edit
    respond_with(@provider)
  end

  def create
    @provider = Provider.create(provider_params)
    respond_with(@provider, location: @provider)
  def update
  end

    @provider.update(provider_params)
    respond_with(@provider, location: @provider)
  end

  def destroy
    @provider.destroy
    respond_with(nil, providers_path)
  end

  private
    def set_provider
      @provider = Provider.find(params[:id])
    end

    def provider_params
      params.require(:provider).permit(:name, :cpfCnpj, :phone, :localization)
    end
end
