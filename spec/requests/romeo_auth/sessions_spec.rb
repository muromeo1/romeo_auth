require 'rails_helper'

RSpec.describe 'SessionsController' do
  let(:user) { create(:user) }
  let(:params) { { email: user.email, password: user.password } }
  let(:token) { Sessions::Create.call(params).token }

  describe 'post /api/v1/sessions/' do
    it { expect(response).to have_http_status(:created) }
    it { expect(response.parsed_body['token']).to be_present }
  end

  describe 'delete /api/v1/sessions/' do
    let(:headers) { { 'Authorization' => token } }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.parsed_body['message']).to eq('Session destroyed') }
  end

  describe 'delete /api/v1/sessions/' do
    let(:headers) { nil }

    it { expect(response).to have_http_status(:unprocessable_entity) }
    it { expect(response.parsed_body['error']).to eq("token can't be nil") }
  end
end
