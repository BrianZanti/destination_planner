require 'rails_helper'

RSpec.describe "destinations endpoint" do
  it "has current weather and a related image" do
    destination = Destination.create!(name: "Hawaii", zip: "11111", description: 'its great', image_url: 'https://placehold.it/300x300.png')

    get "/api/v1/destination/#{destination.id}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:summary]).to_not be_empty
    expect(json[:data][:attributes][:current_temperature].to_s).to_not be_empty
    expect(json[:data][:attributes][:high_temperature].to_s).to_not be_empty
    expect(json[:data][:attributes][:low_temperature].to_s).to_not be_empty
    expect(json[:data][:attributes][:weather_image_url]).to_not be_empty
  end
end
