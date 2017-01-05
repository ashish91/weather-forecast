class External::Api::Weather < External::Api::Base
  CITY_NAME = "New Delhi"

  def forecast
    # Caching forecast data
    if CACHE.fetch(:forecast).nil?
      res = get(uri: "/data/#{VERSION}/forecast", query_params: { q: CITY_NAME })
      CACHE.write(:forecast, res.to_json, expires_in: time_before_day_ends.seconds)
    end
    res = JSON.parse(CACHE.read(:forecast))

    res["list"].map{ |weather_snapshot| build_response(weather_snapshot) }
  end

  def current
    build_response(get(uri: "/data/#{VERSION}/weather", query_params: { q: CITY_NAME }))
  end

  private

  def build_response(response)
    External::Data::Weather.new(response)
  end

  def time_before_day_ends
    (Time.current.end_of_day - Time.current)
  end

  def check_cached?
    CACHE.fetch(:forecast).nil?
  end
end