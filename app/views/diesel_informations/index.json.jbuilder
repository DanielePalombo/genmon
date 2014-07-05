json.array!(@diesel_informations) do |diesel_information|
  json.extract! diesel_information, :id, :raw_value, :level, :created_at
  json.url power_unit_diesel_information_url(diesel_information.power_unit, diesel_information, format: :json)
end
