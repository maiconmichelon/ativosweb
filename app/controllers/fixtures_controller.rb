class FixturesController < ApplicationController
  before_action :set_fixture, only: [:show, :edit, :update, :destroy]

  def index
    @fixtures = Fixture.all
    respond_with(@fixtures)
  end

  def show
    respond_with(@fixture)
  end

  def new
    @fixture = Fixture.new
    respond_with(@fixture)
  end

  def edit
    respond_with(@fixture)
  end

  def create
    @fixture = Fixture.create(fixture_params)
    respond_with(@fixture, location: @fixture)
  end

  def update
    @fixture.update(fixture_params)
    respond_to(@fixture, location: @fixture)
  end

  def destroy
    @fixture.destroy
    respond_to(nil, location: fixtures_path)
  end

  private
    def set_fixture
      @fixture = Fixture.find(params[:id])
    end

    def fixture_params
      params.require(:fixture).permit(:number, :warranty, :provider_id, :acquisition, :type_id, :person_id, :purchaseValue,
        component_fixtures_attributes: [:description, :component_id, :quantity])
    end
end
