class AddProjectStatusValues < ActiveRecord::Migration[6.0]
  def change
    ProjectStatus.create name: "In Construction"
    ProjectStatus.create name: "Planned"
    ProjectStatus.create name: "Built"
  end
end
