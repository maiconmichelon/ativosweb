class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, null: false, default: ""
      t.string :cpfCnpj
      t.string :phone
      t.string :localization
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :providers, :cpfCnpj, unique: true
  end
end
