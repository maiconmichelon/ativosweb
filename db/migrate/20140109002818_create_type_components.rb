class CreateTypeComponents < ActiveRecord::Migration
  def change
    create_table :type_components, :id => false do |t|
      t.references :type
      t.references :component
    end

    add_index :type_components, [:type_id, :component_id], unique: true
  end
end
