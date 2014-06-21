class CreateBudgetMaintenance < ActiveRecord::Migration
  def change
    create_table :budget_maintenances do |t|
      t.references :maintenance
      t.references :budget
    end

    add_index :budget_maintenances, [:maintenance_id, :budget_id], unique: true
  end
end
