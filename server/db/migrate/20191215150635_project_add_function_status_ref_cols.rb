class ProjectAddFunctionStatusRefCols < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :function_id, foreign_key: { to_table: :project_functions }
    add_reference :projects, :status_id, foreign_key: { to_table: :project_statuses }
  end
end
