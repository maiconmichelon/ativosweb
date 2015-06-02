class CreateComponentFixtures < ActiveRecord::Migration
  def change
    create_table :component_fixtures do |t|
      t.references :component, null: false
      t.references :fixture, null: false
      t.integer :quantity, null: false, default: 1
      t.string :description, null: false, default: ""
    end

    add_index :component_fixtures, [:component_id, :fixture_id], unique: true
  end
end
