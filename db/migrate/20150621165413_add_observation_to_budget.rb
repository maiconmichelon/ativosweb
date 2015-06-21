class AddObservationToBudget < ActiveRecord::Migration
  def change
    add_column :budgets, :observation, :string, null: false, default: ''
  end
end
