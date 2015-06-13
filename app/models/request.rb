class Request < ActiveRecord::Base
  belongs_to :responsible, class_name: 'Person'
  belongs_to :approval_responsible, class_name: 'Person'
  has_many :budgets
  
  accepts_nested_attributes_for :budgets, allow_destroy: true

  validates_presence_of :title, :responsible, :status, :approval_responsible, :date
end
