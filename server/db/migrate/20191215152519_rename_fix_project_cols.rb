class RenameFixProjectCols < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :function_id_id, :function_id
    rename_column :projects, :status_id_id, :status_id
  end
end
