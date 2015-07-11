class FixturesController < ApplicationController
  before_action :set_fixture, only: [:show, :edit, :update, :destroy]

  def index
    if search_params
      elements = @company.fixtures

      search_params.each do |key, value|
        elements = elements.send('by_' + key, value) unless value.empty?
      end

      @fixtures = elements.page(params[:page])
    else
      @fixtures = @company.fixtures.page(params[:page])
    end
    respond_with(@fixtures)
  end

  def show
    respond_with(@fixture)
  end

  def new
    @fixture = @company.fixtures.new
    respond_with(@fixture)
  end

  def edit
    respond_with(@fixture)
  end

  def create
    @fixture = @company.fixtures.create(fixture_params)
    respond_with(@company, @fixture)
  end

  def update
    @fixture.update(fixture_params)
    respond_with(@company, @fixture)
  end

  def destroy
    @fixture.destroy
    redirect_to action: :index
  end

  private
    def set_fixture
      @fixture = @company.fixtures.find(params[:id])
    end

    def fixture_params
      params.require(:fixture).permit(:number, :warranty, :provider_id, :acquisition, :type_id, :person_id, :purchaseValue, :company_id, :request_id, 
        component_fixtures_attributes: [:id, :_destroy, :description, :component_id, :quantity])
    end

    def search_params
      return nil unless params[:search]
      params.require(:search).permit(:number, :provider_id, :type_id, :person_id, :acquisition)
    end
end
