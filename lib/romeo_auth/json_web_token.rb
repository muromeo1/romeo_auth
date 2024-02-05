require 'jwt'

module RomeoAuth
  class JsonWebToken
    class << self
      def encode(payload)
        payload[:exp] = RomeoAuth.config.expires_in.to_i

        JWT.encode(payload, RomeoAuth.config.secret_key_base)
      end

      def decode(token)
        body = JWT.decode(token, RomeoAuth.config.secret_key_base)[0]

        ActiveSupport::HashWithIndifferentAccess.new(body)
      rescue StandardError
        nil
      end
    end
  end
end
