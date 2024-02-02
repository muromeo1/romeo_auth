RomeoAuth.setup do |config|
  config.secret_key_base = Rails.application.credentials.secret_key_base
end
