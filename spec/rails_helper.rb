require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

RSpec.configure do |config|
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods

  # it'll run every request when test type == :request,
  # since it's passed the action and the route to describe block
  # as in:
  #
  # describe 'post /api/v1/users' do
  #   it { expect(response.parsed_body['token']).to be_present }
  # end
  config.before(:each, type: :request) do
    request, route = self.class.description.split

    send(request, route, params:)
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
