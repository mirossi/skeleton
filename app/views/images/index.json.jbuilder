json.array!(@images) do |image|
  json.extract! image, :id, :picture, :name, :user_id
  json.url image_url(image, format: :json)
end
