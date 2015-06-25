class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  def index
    @budgets = @company.budgets
    respond_with(@budgets)
  end

  def new
    @budget = @company.budgets.new
    respond_with(@budget)
  end

  def create
    @budget = @company.budgets.create(budget_params)
    respond_with(@company, @budget)
  end

  def edit
    respond_with(@budget)
  end

  def update
    @budget.update(budget_params)
    respond_with(@company, @budget)
  end

  def show
    respond_with(@budget)
  end

  def destroy
    @budget.destroy
    respond_with(nil, location: company_budgets_path)
  end

  private
    def set_budget
      @budget = @company.budgets.find(params[:id])
    end

    def budget_params
      params.require(:budget).permit(:person_id, :value, :company_id, :fixture_id, :description, :date, :provider_id)
    end

end
