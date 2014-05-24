class CreateBudgetMaintenance < ActiveRecord::Migration
  def change
    create_table :budget_maintenances do |t|
      t.references :maintenance
      t.references :budget
    end

    add_index :component_fixtures, [:component_id, :fixture_id], unique: true
  end
end
