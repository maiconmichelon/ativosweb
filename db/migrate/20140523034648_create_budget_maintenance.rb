class CreateBudgetMaintenance < ActiveRecord::Migration
  def change
    create_table :budget_maintenances do |t|
      t.references :maintenance, index: true
      t.references :budget, index: true
    end
  end
end
