class ComponentFixture < ActiveRecord::Base
  belongs_to :component
  belongs_to :fixture
end
