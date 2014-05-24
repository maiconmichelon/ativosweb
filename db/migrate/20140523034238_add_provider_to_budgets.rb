class AddProviderToBudgets < ActiveRecord::Migration
  def change
    add_reference :budgets, :provider, index: true, null: false
  end
end
