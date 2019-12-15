class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :long_desc
      t.text :short_desc
      t.integer :year
      t.string :function
      t.string :status
      t.string :preview_img
      t.text :imgs

      t.timestamps
    end
  end
end
