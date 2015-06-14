class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.date :date, null: false
      t.string :description, null: false
      t.decimal :value, precision: 8, scale: 2, null: false, default: 0
      t.boolean :activate, null: false, default: true
      t.references :person, index: true, null: false
      t.references :fixture, index: true, null: false
      t.references :request, index: true

      t.timestamps
    end
  end
end
