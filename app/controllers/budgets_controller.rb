class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  def index
    @budgets = Budget.all
    respond_with(@budgets)
  end

  def new
    @budget = Budget.new
    respond_with(@budget)
  end

  def create
    @budget = Budget.create(budget_params)
    respond_with(@budget)
  end

  def edit
    respond_with(@budget)
  end

  def update
    @budget.update(budget_params)
    respond_with(@budget, location: @budget)
  end

  def show
    respond_with(@budget)
  end

  def destroy
    @budget.destroy
    respond_with(nil, location: budgets_path)
  end

  private
    def set_budget
      @budget = Budget.find(params[:id])
    end

    def budget_params
      params.require(:budget).permit(:person_id, :value, :fixture_id, :description, :date)
    end

end
