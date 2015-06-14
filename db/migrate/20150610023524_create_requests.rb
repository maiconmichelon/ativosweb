class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.date :date, null: false
      t.string :title, null: false
      t.string :description
      t.references :responsible, index: true, null: false
      t.references :fixture, index: true
      t.integer :status, null: false, default: 0
      t.references :approval_responsible, index: true, null: false
      t.string :type, null: false
      t.references :company, index: true, null: false

      t.timestamps
    end
  end
end
