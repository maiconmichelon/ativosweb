class Provider < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :cpfCnpj

  has_many :fixtures

  scope :activated, -> {where(active: true)}

end
