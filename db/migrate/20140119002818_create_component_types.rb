class CreateComponentTypes < ActiveRecord::Migration
  def change
    create_table :component_types do |t|
      t.references :component, null: false
      t.references :type, null: false
      t.boolean :pre_selected, null: false, default: true
    end

    add_index :component_types, [:component_id, :type_id], unique: true
  end
end
