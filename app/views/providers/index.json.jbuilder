json.array!(@providers) do |provider|
  json.extract! provider, :id, :name, :cpfCnpj, :phone, :localization
  json.url provider_url(provider, format: :json)
end
