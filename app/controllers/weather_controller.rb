class WeatherController < ApplicationController

    # TODO remove hardcoded api key abstracted out to .env or similar
    def show
        # hardcoded api key value here
        @weather_service = WeatherService.new('')
        @city = params[:city] || 'Dublin'
        @weather_data = @weather_service.get_weather(@city)
    end
    
end