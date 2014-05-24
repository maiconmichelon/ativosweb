class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.datetime :date, null: false
      t.string :description, null: false
      t.decimal :value, precision: 8, scale: 2, null: false, default: 0
      t.boolean :activate, null: false, default: true

      t.timestamps
    end
  end
end
