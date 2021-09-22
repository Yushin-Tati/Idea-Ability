class AddIsActiveToAbilities < ActiveRecord::Migration[5.2]
  def change
    add_column :abilities, :is_active, :boolean, null: false, default: false
  end
end
