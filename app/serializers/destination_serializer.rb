class DestinationSerializer
  include FastJsonapi::ObjectSerializer

  attributes :summary,
             :current_temperature,
             :high_temperature,
             :low_temperature,
             :weather_image_url,
             :name,
             :description,
             :zip,
             :image_url
end
