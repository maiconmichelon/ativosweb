class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  def index
    @providers = @company.providers
    respond_with(@providers)
  end

  def show
    respond_with(@provider)
  end

  def new
    @provider = @company.providers.new
    respond_with(@provider)
  end

  def edit
    respond_with(@provider)
  end

  def create
    @provider = @company.providers.create(provider_params)
    respond_with(@company, @provider)
  end

  def update
    @provider.update(provider_params)
    respond_with(@company, @provider)
  end

  def destroy
    @provider.destroy
    redirect_to action: :index
  end

  private
    def set_provider
      @provider = @company.providers.find(params[:id])
    end

    def provider_params
      params.require(:provider).permit(:name, :cpfCnpj, :phone, :localization, :company_id)
    end
end
