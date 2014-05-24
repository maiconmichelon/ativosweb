class Budget < ActiveRecord::Base
  belongs_to :person
  belongs_to :fixture
  belongs_to :provider

  validates_presence_of :person, :value, :fixture, :description, :date, :provider
end
