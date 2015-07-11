class MaintenanceRequest < Request
  belongs_to :fixture
  validates_presence_of :fixture

  scope :by_fixture_id, -> (fixture_id) { where(fixture_id: fixture_id)}
end
