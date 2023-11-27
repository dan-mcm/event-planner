require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe 'GET /show' do
    let(:city) { 'Dublin' }
    let(:user) { create(:user) }

    before(:each) do
      sign_in user
    end

    it 'returns a success response' do
      get :show, params: { city: city }
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get :show, params: { city: city }
      expect(response).to render_template(:show)
    end
  end
end
