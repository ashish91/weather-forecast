class External::Data::Weather

  attr_reader :date, :min_temp, :max_temp, :temp

  def initialize(data)
    self.date = Time.at(data["dt"]).in_time_zone
    self.temp = data["main"]["temp"]
    self.min_temp = data["main"]["temp_min"]
    self.max_temp = data["main"]["temp_max"]
  end

  private
  attr_writer :date, :min_temp, :max_temp, :temp

end