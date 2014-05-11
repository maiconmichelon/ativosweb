class Fixture < ActiveRecord::Base
  validates_presence_of :number, :type
  validates_uniqueness_of :number, scope: :type
  
  belongs_to :person
  belongs_to :provider
  belongs_to :type
  has_many :component_fixtures
  
  accepts_nested_attributes_for :component_fixtures
  
end
