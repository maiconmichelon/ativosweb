class Person < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :group

  has_many :fixtures
  belongs_to :group

  scope :activated, -> {where(active: true)}

  def to_s
    name
  end

end
