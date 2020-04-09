class OpenWeatherMapService
  def self.current_weather(location)
    response = conn.get('weather') do |req|
      req.params['q'] = location
      req.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new "https://api.openweathermap.org/data/2.5" do |conn|
      conn.params['appid'] = ENV['OPEN_WEATHER_MAP_KEY']
    end
  end
end
