class Budget < ActiveRecord::Base
  belongs_to :person
  belongs_to :provider
  belongs_to :company
  belongs_to :request

  validates_presence_of :value, :date, :provider

  def to_s
  	decorate.format
  end

end
