class WeatherController < ApplicationController
    before_action :authenticate_user!
    
    def show
        api_key = ENV['WEATHER_API_KEY']
        Rails.logger.info("API Key: #{api_key}")
        @weather_service = WeatherService.new(api_key)
        @city = params[:city] || 'Dublin'
        @weather_data = @weather_service.get_weather(@city)
    end
    
end