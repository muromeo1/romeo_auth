require 'rails_helper'

RSpec.describe 'UsersController' do
  let(:random_pass) { Faker::Internet.password }
  let(:params) do
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: random_pass,
      password_confirmation: random_pass
    }.as_json
  end

  describe 'post /api/v1/users' do
    it { expect(response).to have_http_status(:created) }
    it { expect(response.parsed_body['token']).to be_present }
  end
end
