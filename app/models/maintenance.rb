class Maintenance < ActiveRecord::Base
  has_many :budget_maintenances
  accepts_nested_attributes_for :budget_maintenances

  validates_presence_of :description, :value, :date
end
