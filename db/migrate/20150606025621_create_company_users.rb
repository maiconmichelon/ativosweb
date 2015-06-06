class CreateCompanyUsers < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
      t.references :user, null: false
      t.references :company, null: false
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
