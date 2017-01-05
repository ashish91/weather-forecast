json.current_weather do
  json.(@current_weather, :date, :min_temp, :max_temp, :temp)
end