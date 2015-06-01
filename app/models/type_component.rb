class TypeComponent < ActiveRecord::Base
  belongs_to :component
  belongs_to :type

  validates_presence_of :component, :type
  validates_uniqueness_of :component, scope: :type

end