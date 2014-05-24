class AddDescriptionAndQuantityToComponentFixture < ActiveRecord::Migration
  def change
    add_column :component_fixtures, :quantity, :integer, null: false, default: 1
    add_column :component_fixtures, :description, :string, null: false, default: ""
  end
end
