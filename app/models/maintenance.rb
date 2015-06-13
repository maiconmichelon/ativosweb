class Maintenance < ActiveRecord::Base
  belongs_to :person
  belongs_to :fixture

  validates_presence_of :description, :value, :date, :person

  def to_s
    description
  end

end
