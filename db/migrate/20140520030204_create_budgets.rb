class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :description, null: false
      t.decimal :value, precision: 8, scale: 2, null: false
      t.references :fixture, index: true
      t.references :person, index: true, null: false
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
