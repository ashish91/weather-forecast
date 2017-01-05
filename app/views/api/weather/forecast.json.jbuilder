json.forecast @forecast do |weather|
  json.(weather, :date, :min_temp, :max_temp, :temp)
end