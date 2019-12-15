class RemoveProjectImgFields < ActiveRecord::Migration[6.0]
  def change
    remove_columns :projects, :preview_img, :imgs
  end
end
