class CreateComponentFixtures < ActiveRecord::Migration
  def change
    create_table :component_fixtures, :id => false do |t|
      t.references :component
      t.references :fixture
    end

    add_index :component_fixtures, [:component_id, :fixture_id], unique: true
  end
end
