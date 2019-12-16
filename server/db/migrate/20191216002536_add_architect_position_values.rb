class AddArchitectPositionValues < ActiveRecord::Migration[6.0]
  def change
    ArchitectPosition.create(name: "Leading Architect")
    ArchitectPosition.create(name: "Project Architect")
  end
end
