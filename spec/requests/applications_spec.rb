require 'rails_helper'

RSpec.describe 'Applications', type: :request do
  describe 'GET /' do
    it 'returns the application default view' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
