class Fixture < ActiveRecord::Base
  belongs_to :company
  belongs_to :person
  belongs_to :provider
  belongs_to :type
  belongs_to :purchase_request, foreign_key: 'request_id'
  has_many :component_fixtures, autosave: true, dependent: :delete_all
  has_many :maintenances

  validates_presence_of :number, :type
  validates_uniqueness_of :number, scope: :type

  accepts_nested_attributes_for :component_fixtures, allow_destroy: true

  scope :by_person_id, -> (person_id) { where(person_id: person_id)}
  scope :by_type_id, -> (type_id) { where(type_id: type_id)}
  scope :by_provider_id, -> (provider_id) { where(provider_id: provider_id)}
  scope :by_number, -> (number) { where(number: number)}
  scope :by_acquisition, -> (acquisition) { where(acquisition: acquisition)}

  def to_s
    complete_description
  end

  def complete_description
    type.nil? ? "#{number}" : "#{number} - #{type.description}"
  end

end
