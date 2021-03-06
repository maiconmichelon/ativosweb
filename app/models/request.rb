class Request < ActiveRecord::Base
  enum status: [ :pending, :approved, :rejected ]
  
  belongs_to :responsible, class_name: 'User'
  belongs_to :approval_responsible, class_name: 'User'
  belongs_to :company
  belongs_to :budget_approved, class_name: 'Budget'
  has_many :budgets, dependent: :delete_all
  
  accepts_nested_attributes_for :budgets, allow_destroy: true

  validates_presence_of :title, :responsible, :status, :approval_responsible, :date
  validate :validate_budget_approved

  after_initialize :default_values

  scope :by_title, -> (title) { where('title LIKE ?', "%#{title}%")}
  scope :by_description, -> (description) { where('description LIKE ?', "%#{description}%")}
  scope :by_responsible_id, -> (responsible_id) { where(responsible_id: responsible_id)}
  scope :by_status, -> (status) { where(status: status)}
  scope :by_fuxture_id, -> (fixture_id) { where(fixture_id: fixture_id)}
  scope :by_date, -> (date) { where(date: date)}

  def status_i18n
    I18n.translate('enumerize.request.status.' + status)
  end

  def validate_budget_approved
    if approved? 
      if budget_approved.nil?
        errors.add(I18n.translate('request.approved_budget_cant_be_null'))
      end
    else
      if budget_approved
        errors.add(I18n.translate('request.approved_budget_should_be_null'))
      end
    end
  end

private
  def default_values
    self.status ||= 0
  end

end
