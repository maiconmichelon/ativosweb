class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name, null: false, default: ""
      t.references :company, index: true, null: false

      t.timestamps
    end

    add_index :components, [:name, :company_id], unique: true
  end
end
