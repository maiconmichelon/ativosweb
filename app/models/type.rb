class Type < ActiveRecord::Base
  validates_presence_of :description, :initial_code
  validates_uniqueness_of :description

  has_many :type_components
  has_many :components, :through => :type_components

  scope :activated, -> { where(active: true)}

end
