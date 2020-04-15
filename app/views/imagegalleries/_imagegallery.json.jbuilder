json.extract! imagegallery, :id, :title, :caption, :created_at, :updated_at
json.url imagegallery_url(imagegallery, format: :json)
