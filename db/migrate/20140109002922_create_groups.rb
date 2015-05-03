class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false, default: ''
      t.boolean :active, null: false, default: true
      t.references :company, index: true, null: false

      t.timestamps
    end

    add_index :groups, [:name, :company_id], unique: true
  end
end
