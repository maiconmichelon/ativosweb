class Maintenance < ActiveRecord::Base
  has_many :budget_maintenances
  has_many :budgets, through: :budget_maintenances 
  belongs_to :person
  belongs_to :fixture

  accepts_nested_attributes_for :budget_maintenances, allow_destroy: true
  validates_presence_of :description, :value, :date, :person

  def to_s
    description
  end

end
