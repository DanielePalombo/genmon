json.array!(@power_units) do |power_unit|
  json.extract! power_unit, :id, :code
  json.url power_unit_url(power_unit, format: :json)
end
