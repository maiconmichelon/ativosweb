class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :owner_id, nullable: false, index: true

      t.timestamps
    end

    add_index :companies, [:name, :owner_id], unique: true
  end
end
