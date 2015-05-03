class Provider < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :cpfCnpj, scope: :company

  has_many :fixtures
  belongs_to :company

  scope :activated, -> {where(active: true)}

  def to_s
    name
  end

end
