require 'rails_helper'

RSpec.describe Sessions::Destroy, type: :interactor do
  describe '.call' do
    subject(:interactor) { described_class.call(params) }

    let(:user) { create(:user) }
    let(:token) { RomeoAuth::JsonWebToken.encode(user_id: user.id) }

    let(:params) { {} }

    context 'when has token is still valid' do
      let(:params) { { token: } }

      it { expect(interactor).to be_a_success }
    end

    context 'when token is invalid' do
      let(:params) { { token: 'invalid token' } }

      it { expect(interactor).to be_a_failure }
      it { expect(interactor.error).to eq('Invalid token') }
    end
  end
end
