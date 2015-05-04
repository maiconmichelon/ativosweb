class Type < ActiveRecord::Base
  validates_presence_of :description, :initial_code
  validates_uniqueness_of :description, scope: :company

  has_many :type_components
  belongs_to :company

  scope :activated, -> { where(active: true)}
  accepts_nested_attributes_for :type_components

  def to_s
    description
  end

end
