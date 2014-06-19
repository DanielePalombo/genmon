json.array!(@alarms) do |alarm|
  json.extract! alarm, :id, :raw_value, :state
  json.url alarm_url(alarm, format: :json)
end
