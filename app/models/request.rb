class Request < ActiveRecord::Base
  enum status: [ :pending, :approved, :rejected ]
  
  belongs_to :responsible, class_name: 'User'
  belongs_to :approval_responsible, class_name: 'User'
  belongs_to :company
  has_many :budgets
  
  accepts_nested_attributes_for :budgets, allow_destroy: true

  validates_presence_of :title, :responsible, :status, :approval_responsible, :date

  after_initialize :default_values

  def status_i18n
    I18n.translate('enumerize.request.status.' + status)
  end

private
  def default_values
    self.status ||= 0
  end

end
