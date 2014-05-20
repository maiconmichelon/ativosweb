class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :description
      t.decimal{8 :price
      t.references :fixture, index: true
      t.references :person, index: true
      t.datetime :date
    end
  end
end
