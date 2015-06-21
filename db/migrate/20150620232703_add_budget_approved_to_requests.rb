class AddBudgetApprovedToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :budget_approved, index: true
  end
end
