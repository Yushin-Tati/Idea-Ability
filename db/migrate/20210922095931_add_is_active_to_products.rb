class AddIsActiveToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :is_active, :boolean, null: false, default: false
  end
end
