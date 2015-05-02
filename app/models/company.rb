class Company < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :fixtures
  has_many :people
  has_many :components
  has_many :providers
  has_many :types
end
