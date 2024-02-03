require 'romeo_auth/auth/helper'

RomeoAuth.setup do |config|
  config.secret_key_base = Rails.application.credentials.secret_key_base
end

Rails.application.config.to_prepare do
  ApplicationController.include RomeoAuth::Auth::Helper
end
