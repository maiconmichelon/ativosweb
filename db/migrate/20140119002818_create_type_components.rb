class CreateTypeComponents < ActiveRecord::Migration
  def change
    create_table :type_components do |t|
      t.references :component
      t.references :type
    end

    add_index :type_components, [:component_id, :type_id], unique: true
  end
end
