class Component < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  scope :activated, -> { where(active: true)}
end
