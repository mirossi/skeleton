json.array!(@wines) do |wine|
  json.extract! wine, :id, :name, :year, :country_code
  json.url wine_url(wine, format: :json)
end
