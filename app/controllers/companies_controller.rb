class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    if (current_user)
      @companies = current_user.companies
      respond_with(@companies)
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @company = Company.new
    respond_with(@company)
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    @company.owner = current_user
    if @company.save
      redirect_to action: :index
    else
      respond_with(@company)
    end
  end

  def update
    @company.update(company_params)
    redirect_to action: :index
  end

  def destroy
    @company.destroy
    respond_with(@company)
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :owner_id)
    end
end
