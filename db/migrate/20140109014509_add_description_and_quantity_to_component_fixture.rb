class AddDescriptionAndQuantityToComponentFixture < ActiveRecord::Migration
  def change
    add_column :component_fixtures, :quantity, :integer
    add_column :component_fixtures, :description, :string
  end
end
