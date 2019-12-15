class AddForeginKeysProjectArchitectAssociation < ActiveRecord::Migration[6.0]
  def change
    add_reference :project_architect_associations, :architects, foreign_key: true
    add_reference :project_architect_associations, :projects, foreign_key: true
  end
end
