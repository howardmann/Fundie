class AddDateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :deadline, :date
  end
end
