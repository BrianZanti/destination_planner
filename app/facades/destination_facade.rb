class DestinationFacade
  attr_reader :weather_image_url,
              :destination

  def initialize(destination_id)
    @destination = Destination.find(destination_id)

    json = OpenWeatherMapService.current_weather(@destination.name)
    @weather = Weather.new(json)

    json = GiphyService.search(@weather.summary)
    @weather_image_url = json[:data].first[:images][:downsized_large][:url]
  end

  def id
    @destination.id
  end

  def date
    Time.now.strftime("%A %B %e")
  end

  def name
    @destination.name
  end

  def zip
    @destination.zip
  end

  def description
    @destination.description
  end

  def image_url
    @destination.image_url
  end

  def current_temperature
    @weather.current_temperature
  end

  def high_temperature
    @weather.high_temperature
  end

  def low_temperature
    @weather.low_temperature
  end

  def summary
    @weather.summary
  end
end
