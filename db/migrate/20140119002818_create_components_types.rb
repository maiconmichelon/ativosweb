class CreateComponentsTypes < ActiveRecord::Migration
  def change
    create_table :components_types do |t|
      t.references :component
      t.references :type
    end

    add_index :components_types, [:component_id, :type_id], unique: true
  end
end
