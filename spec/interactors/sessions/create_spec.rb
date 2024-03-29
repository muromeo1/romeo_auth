require 'rails_helper'

RSpec.describe Sessions::Create, type: :interactor do
  describe '.call' do
    subject(:interactor) { described_class.call(params) }

    let(:user) { create(:user) }
    let(:params) { {} }

    context 'when has correct credentials' do
      let(:params) { { email: user.email, password: user.password } }

      it { expect(interactor).to be_a_success }
      it { expect(interactor.token).to be_present }
    end

    context 'when has wrong credentials' do
      let(:params) { { email: 'aaa@bbb.com', password: '123' } }

      it { expect(interactor).to be_a_failure }
      it { expect(interactor.error).to match('Invalid credentials') }
    end
  end
end
