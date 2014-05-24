class Budget < ActiveRecord::Base
  belongs_to :person
  belongs_to :fixture
  belongs_to :provider

  validates_presence_of :person, :value, :description, :date, :provider

  def to_s
    "#{date} - #{description} - #{value}"
  end

end
