class GiphyService
  def self.search(search_term)
    response = conn.get('search') do |req|
      req.params['q'] = search_term
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new "https://api.giphy.com/v1/gifs" do |conn|
      conn.params['api_key'] = ENV['GIPHY_API_KEY']
    end
  end
end
