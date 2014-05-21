class Budget < ActiveRecord::Base
  belongs_to :person
  belongs_to :fixture

  validates_presence_of :person, :value, :fixture, :description, :date
end
