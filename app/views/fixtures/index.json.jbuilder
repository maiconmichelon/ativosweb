json.array!(@fixtures) do |fixture|
  json.extract! fixture, :id, :number, :warranty, :provider_id, :acquisition, :type_id, :person_id, :purchaseValue
  json.url fixture_url(fixture, format: :json)
end
