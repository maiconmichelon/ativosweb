json.array!(@components) do |component|
  json.extract! component, :id, :name, :activate
  json.url component_url(component, format: :json)
end
