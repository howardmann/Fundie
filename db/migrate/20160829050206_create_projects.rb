class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.decimal :target_amount
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
