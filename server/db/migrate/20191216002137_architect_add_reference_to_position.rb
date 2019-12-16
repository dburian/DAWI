class ArchitectAddReferenceToPosition < ActiveRecord::Migration[6.0]
  def change
    add_reference :architects, :position, foreign_key: { to_table: :architect_positions }
  end
end
