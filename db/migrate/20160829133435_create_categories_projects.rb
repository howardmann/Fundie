class CreateCategoriesProjects < ActiveRecord::Migration
  def change
    create_table :categories_projects, :id => false do |t|
      t.integer :project_id
      t.integer :category_id
    end
  end
end
