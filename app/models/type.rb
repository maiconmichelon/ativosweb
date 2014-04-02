class Type < ActiveRecord::Base
  validates_presence_of :description, :initial_code
  validates_uniqueness_of :description

  has_and_belongs_to_many :components

  scope :activated, -> { where(active: true)}
  accepts_nested_attributes_for :components

  def to_s
    description
  end

end
