class Fixture < ActiveRecord::Base
  belongs_to :company
  belongs_to :person
  belongs_to :provider
  belongs_to :type
  has_many :component_fixtures
  has_many :maintenances

  validates_presence_of :number, :type
  validates_uniqueness_of :number, scope: :type

  accepts_nested_attributes_for :component_fixtures, allow_destroy: true

  def description
    type.nil? ? "#{number}" : "#{number} - #{type.description}"
  end

  def to_s
    description
  end

end
