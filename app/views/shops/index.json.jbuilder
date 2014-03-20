json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :street, :zipcode, :city, :phone, :country
  json.url shop_url(shop, format: :json)
end
