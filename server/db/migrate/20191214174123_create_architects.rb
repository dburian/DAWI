class CreateArchitects < ActiveRecord::Migration[6.0]
  def change
    create_table :architects do |t|
      t.string :name
      t.string :position
      t.text :desc

      t.timestamps
    end
  end
end
