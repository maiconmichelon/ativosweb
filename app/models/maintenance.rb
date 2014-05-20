class Maintenance < ActiveRecord::Base
  validates_presence_of :description, :value, :date
end
