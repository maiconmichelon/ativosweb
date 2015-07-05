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

  def to_s
    decorate.description
  end

end
