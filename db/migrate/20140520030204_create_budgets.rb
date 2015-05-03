class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :description, null: false
      t.decimal :value, precision: 8, scale: 2, null: false
      t.datetime :date, null: false
      t.references :company, index: true, null: false
      t.references :provider, index: true, null: false

      t.timestamps
    end
  end
end
