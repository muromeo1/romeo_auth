require 'romeo_auth/json_web_token'
require 'romeo_auth/version'
require 'romeo_auth/engine'

module RomeoAuth
  class Configuration
    attr_accessor :secret_key_base, :expires_in

    def initializers
      @secret_key_base = nil
      @expires_in = nil
    end
  end

  class << self
    attr_reader :config

    def setup
      @config ||= Configuration.new

      yield(config)
    end
  end
end
