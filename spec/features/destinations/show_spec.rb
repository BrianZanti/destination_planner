require 'rails_helper'

RSpec.describe "Destination Show Page" do
  it "shows current weather" do
    destination = Destination.create!(name: "Hawaii", zip: "11111", description: 'its great', image_url: 'https://placehold.it/300x300.png')
    visit '/'

    within first('.destination') do
      click_on 'Show'
    end

    expect(current_path).to eq("/destinations/#{destination.id}")
    expect(page).to have_content(destination.name)
    expect(page).to have_content(destination.zip)
    expect(page).to have_content(destination.description)
    within '#current-weather' do
      expect(first('.date').text).to_not be_empty
      expect(first('.high-temp').text).to_not be_empty
      expect(first('.low-temp').text).to_not be_empty
      expect(first('.current-temp').text).to_not be_empty
      expect(first('.summary').text).to_not be_empty
    end
  end

  it "shows an image related to current weather" do
    destination = Destination.create!(name: "Hawaii", zip: "11111", description: 'its great', image_url: 'https://placehold.it/300x300.png')

    visit destination_path(destination)

    expect(page).to have_css("img[src*='media2.giphy.com']")
  end
end
