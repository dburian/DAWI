class ProjectSerializer < ActiveModel::Serializer

  include Rails.application.routes.url_helpers

  attributes :id, :name, :long_desc, :year, :function_id, :status_id, :architects, :images

 #def images
 # return unless object.images.attachments
 # image_urls = object.images.map do |image| 
 #   URI.join(
 #     ActionController::Base.asset_host, 
 #     rails_blob_path(image))
 # end
 #
 # image_urls
 #end 

end
