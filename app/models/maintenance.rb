class Maintenance < ActiveRecord::Base
  has_many :budget_maintenances
  accepts_nested_attributes_for :budget_maintenances
  belongs_to :person

  validates_presence_of :description, :value, :date, :person

  def to_s
    description
  end

end
