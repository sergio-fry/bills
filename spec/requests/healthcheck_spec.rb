require 'rails_helper'

RSpec.describe 'Healthchecks' do
  describe 'GET /healthcheck' do
    it 'works!' do
      get '/healthcheck'
      expect(response).to have_http_status(:ok)
    end
  end
end
