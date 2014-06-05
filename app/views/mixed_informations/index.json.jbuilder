json.array!(@diesel_informations) do |diesel_information|
  json.extract! diesel_information, :id, :value, :level, :created_at
  json.url diesel_information_url(diesel_information, format: :json)
end
