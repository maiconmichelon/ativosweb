class Fixture < ActiveRecord::Base
  validates_presence_of :number, :type_id
  validates_uniqueness_of :number, scope: :type_id

  has_many :component_fixtures
  belongs_to :person
  belongs_to :provider
  belongs_to :type
end
