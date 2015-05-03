class Company < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :fixtures
  has_many :groups
  has_many :components
  has_many :providers
  has_many :types
  has_many :budgets

  has_many :maintenances, through: :fixtures
  has_many :people, through: :groups
  

end
