class MaintenanceRequest < Request
  belongs_to :fixture
  validates_presence_of :fixture
end
