class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :number, null: false, default: 1
      t.string :warranty
      t.references :provider
      t.date :acquisition
      t.references :type, null: false
      t.references :person
      t.decimal :purchaseValue, :precision => 10, :scale => 2
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :fixtures, [:number, :type_id], unique: true
  end
end
