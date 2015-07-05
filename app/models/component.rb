class Component < ActiveRecord::Base
  belongs_to :company

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :company

  def to_s
    name
  end

end
