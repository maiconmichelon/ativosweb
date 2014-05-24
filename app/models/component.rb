class Component < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  scope :activated, -> { where(active: true)}

  def to_s
    name
  end

end
