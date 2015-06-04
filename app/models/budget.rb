class Budget < ActiveRecord::Base
  belongs_to :person
  belongs_to :provider
  belongs_to :company

  validates_presence_of :value, :description, :date, :provider

  def to_s
  	decorate.format
  end

end
