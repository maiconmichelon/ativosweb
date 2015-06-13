class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :value, precision: 8, scale: 2, null: false
      t.date :date, null: false
      t.references :provider, index: true, null: false
      t.references :request, null: false

      t.timestamps
    end
  end
end
