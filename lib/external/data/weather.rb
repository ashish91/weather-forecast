class External::Data::Weather

  attr_reader :date, :temp

  def initialize(data)
    self.date = Time.at(data["dt"]).in_time_zone
    self.temp = data["main"]["temp"]
  end

  private
  attr_writer :date, :temp

end