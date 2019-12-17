class ProjectSerializer < ActiveModel::Serializer

  include Rails.application.routes.url_helpers

  attributes :id, :name, :long_desc, :year, :function_id, :status_id, :architects, :images

  def images
    image_urls = []
    object.images.map do |image|   
      image_urls << rails_blob_path(image, only_path: true)

    end
  end

end
