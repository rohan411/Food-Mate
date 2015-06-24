RSpec.describe ApplicationController, :type => :controller do

  describe 'GET #status' do

    it 'returns the user for a given session_token' do
      get :status, {session_token: 'random'}
      expect(response.status).to eq(200)
    end

  end
end
