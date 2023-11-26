require 'httparty'

class WeatherService
  include HTTParty

  base_uri 'http://api.openweathermap.org/data/2.5'
  
  def initialize(api_key)
    @api_key = api_key
  end

  def get_weather(city)
    options = {
      query: {
        q: city,
        units: 'metric',
        appid: @api_key
      }
    }

    response = self.class.get('/weather', options)

    # Check if the request was successful
    if response.success?
      return response.parsed_response
    else
      # Handle errors, you might want to raise an exception or return a default value
      puts "Error: #{response.code}, Message: #{response.message}"
      return nil
    end
  end
end
