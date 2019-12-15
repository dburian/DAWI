class ProjectsRemoveFunctionStatusStringCols < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :function, :string
    remove_column :projects, :status, :string
  end
end
