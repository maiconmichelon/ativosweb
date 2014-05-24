class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :number, null: false, default: 1
      t.string :warranty
      t.references :provider, index: true
      t.date :acquisition
      t.references :type, null: false, index: true
      t.references :person, index: true
      t.decimal :purchaseValue, :precision => 10, :scale => 2
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :fixtures, [:number, :type_id], unique: true
  end
end
