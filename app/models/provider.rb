class Provider < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :cpfCnpj, scope: :company

  before_validation :normalize_cpfCnpj

  has_many :fixtures
  belongs_to :company

  def to_s
    name
  end

private
  def normalize_cpfCnpj
    self[:cpfCnpj] = nil if self[:cpfCnpj].blank?
  end

end
