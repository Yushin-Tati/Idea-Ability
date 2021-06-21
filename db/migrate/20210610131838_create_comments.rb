class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :target, null: false, polymorphic: true
      t.integer :user_id, null: false
      t.text :text, null: false
      t.boolean :is_active, null: false, default: false
      t.timestamps
    end
  end
end
