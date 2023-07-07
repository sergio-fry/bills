require 'rails_helper'

RSpec.describe 'Home' do
  describe 'GET /' do
    it 'works!' do
      get '/'
      expect(response).to have_http_status(:redirect)
    end

    it 'redirects to org page when primary exists'
    it 'redirects to new org page when no primary exists'
  end
end
