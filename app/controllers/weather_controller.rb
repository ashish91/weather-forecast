class WeatherController < ApplicationController

  def index
    forecast = weather_api.forecast
    tomorrow = (Time.current + 1.day).in_time_zone
    forecast = forecast.select do |f|
      f.date >= tomorrow.beginning_of_day && f.date < tomorrow.end_of_day
    end

    @data = Hash[
      forecast.map do |f|
        set_min_max_temp(f)
        [f.temp, f.date.strftime("%H:%M")]
      end
    ]
  end

  private
  def weather_api
    @api ||= External::Api::Weather.new
  end

  def set_min_max_temp(weather)
    if @max_temp.nil? || weather.temp > @max_temp
      @max_temp = weather.temp
      @time_for_max_temp = weather.date
    end
    if @min_temp.nil? || weather.temp < @min_temp
      @min_temp = weather.temp
      @time_for_min_temp = weather.date
    end
  end
end