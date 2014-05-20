class AddPersonToMaintenance < ActiveRecord::Migration
  def change
    add_reference :maintenances, :person, index: true
  end
end
