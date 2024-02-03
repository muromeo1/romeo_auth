require 'rails_helper'

# Example of the authentication in use
# outside the gem

RSpec.describe 'PostsController' do
  let(:user) { create(:user) }
  let(:auth) { Users::Authenticate.call(email: user.email, password: user.password) }

  let(:headers) { { 'Authorization' => auth.token } }
  let(:params) { {} }

  describe 'get /api/v1/posts' do
    it { expect(response).to have_http_status(:ok) }
    it { expect(response.parsed_body['user']).to eq(user.as_json) }
  end
end
