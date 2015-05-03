class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name, null: false, default: ""
      t.boolean :active, null: false, default: true
      t.references :company, index: true, null: false

      t.timestamps
    end

    add_index :components, [:name, :company_id], unique: true
  end
end
