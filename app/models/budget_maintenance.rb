class BudgetMaintenance < ActiveRecord::Base
  belongs_to :maintenance
  belongs_to :budget

  validates_presence_of :budget, :maintenance
end
