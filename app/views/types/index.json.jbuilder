json.array!(@types) do |type|
  json.extract! type, :id, :description, :active, :initial_code
  json.url type_url(type, format: :json)
end
