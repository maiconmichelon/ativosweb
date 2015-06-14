class Request < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: {pending: 0, approved: 1, rejected: 2}
  
  belongs_to :responsible, class_name: 'User'
  belongs_to :approval_responsible, class_name: 'User'
  belongs_to :company
  has_many :budgets
  
  accepts_nested_attributes_for :budgets, allow_destroy: true

  validates_presence_of :title, :responsible, :status, :approval_responsible, :date

  after_initialize :default_values

private
  def default_values
    self.status ||= 0
  end

end
