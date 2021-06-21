class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :text, null: false
      t.string :image_id
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
