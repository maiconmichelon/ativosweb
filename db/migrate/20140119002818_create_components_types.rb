class CreateComponentsTypes < ActiveRecord::Migration
  def change
    create_table :components_types do |t|
      t.references :component_id
      t.references :type_id
    end

    add_index :components_types, [:component_id, :type_id], unique: true
  end
end
