class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, null: false, default: ""
      t.string :cpfCnpj
      t.string :phone
      t.string :localization
      t.references :company, index: true, null: false

      t.timestamps
    end

    add_index :providers, [:cpfCnpj, :company_id], unique: true
  end
end
