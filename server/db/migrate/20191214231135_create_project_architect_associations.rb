class CreateProjectArchitectAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :project_architect_associations do |t|

      t.timestamps
    end
  end
end
