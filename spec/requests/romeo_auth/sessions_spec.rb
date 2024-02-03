require 'rails_helper'

RSpec.describe 'SessionsController' do
  let(:user) { create(:user) }
  let(:params) { { email: user.email, password: user.password } }

  describe 'post /api/v1/sessions/' do
    it { expect(response).to have_http_status(:created) }
    it { expect(response.parsed_body['token']).to be_present }
  end
end
