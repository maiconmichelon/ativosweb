class ComponentFixture < ActiveRecord::Base
  belongs_to :component
  belongs_to :fixture

  validates_presence_of :component, :quantity
  validates_uniqueness_of :component, scope: :fixture
end
