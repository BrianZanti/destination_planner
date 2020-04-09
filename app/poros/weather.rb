class Weather
  attr_reader :current_temperature,
              :high_temperature,
              :low_temperature,
              :summary

  def initialize(weather_data)
    @current_temperature = weather_data[:main][:temp]
    @high_temperature = weather_data[:main][:temp_max]
    @low_temperature = weather_data[:main][:temp_min]
    @summary = weather_data[:weather].first[:description]
  end
end
