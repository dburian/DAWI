json.extract! project, :id, :name, :long_desc, :short_desc, :year, :function, :status, :preview_img, :imgs, :created_at, :updated_at
json.url project_url(project, format: :json)
