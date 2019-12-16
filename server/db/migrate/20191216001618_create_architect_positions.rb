class CreateArchitectPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :architect_positions do |t|
      t.string :name

      t.timestamps
    end
  end
end
