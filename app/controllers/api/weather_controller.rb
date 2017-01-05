class Api::WeatherController < ApplicationController

  # GET /weather/forecast.json
  def forecast
    @forecast = weather_api.forecast
  end

  # GET /weather/current.json
  def current
    @current_weather = weather_api.current
  end

  private
  def weather_api
    @api ||= External::Api::Weather.new
  end

end
