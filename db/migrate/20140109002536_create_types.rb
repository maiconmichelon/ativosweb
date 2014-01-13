class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :description, null: false, default: ""
      t.boolean :active, null: false, default: true
      t.integer :initial_code, null: false, default: 1

      t.timestamps
    end

    add_index :types, :description, unique: true
  end
end
