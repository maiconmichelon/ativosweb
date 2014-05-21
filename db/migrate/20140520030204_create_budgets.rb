class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :description
      t.decimal :value, precision: 8, scale: 2
      t.references :fixture, index: true
      t.references :person, index: true
      t.datetime :date
    end
  end
end
