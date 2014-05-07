class ComponentFixture < ActiveRecord::Base
  belongs_to :component
  belongs_to :fixture
  
  validates_presence_of :component, :fixture, :description
  
end
