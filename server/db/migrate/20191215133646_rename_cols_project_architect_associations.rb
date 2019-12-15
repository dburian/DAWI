class RenameColsProjectArchitectAssociations < ActiveRecord::Migration[6.0]
  def change
    rename_column :project_architect_associations, :projects_id, :project_id
    rename_column :project_architect_associations, :architects_id, :architect_id
  end
end
