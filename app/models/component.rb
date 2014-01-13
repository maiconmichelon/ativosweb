class Component < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :type_components
  has_many :types, through: :type_components

  scope :activated, -> { where(active: true)}

end
