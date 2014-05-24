class Group < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :fixtures

  scope :activated, -> {where(active: true)}

  def to_s
    name
  end

end
