class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :record_type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end