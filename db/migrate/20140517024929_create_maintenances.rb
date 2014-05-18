class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.references :localization, index: true
      t.datetime :date
      t.string :description
      t.decimal :value, precision: 5, scale: 2
      t.boolean :activate
    end
  end
end
