class CreateComponentsTypes < ActiveRecord::Migration
  def change
    create_table :components_types do |t|
      # t.belongs_to :component
      # t.belongs_to :type

      t.integer :component_id
      t.integer :type_id
    end

    add_index :components_types, [:component_id, :type_id]
  end
end
