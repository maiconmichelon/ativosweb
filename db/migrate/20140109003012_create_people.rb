class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false, default: ""
      t.references :group, index: true
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :people, :name, unique: true
  end
end
