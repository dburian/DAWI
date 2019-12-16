class ArchitectPositionOutsourced < ActiveRecord::Migration[6.0]
  def change
    remove_column :architects, :position, :string
  end
end
