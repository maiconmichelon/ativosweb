class Maintenance < ActiveRecord::Base
  belongs_to :person
  belongs_to :fixture
  belongs_to :maintenance_request, foreign_key: 'request_id'

  validates_presence_of :description, :value, :date, :person, :fixture

  def to_s
    description
  end

end
