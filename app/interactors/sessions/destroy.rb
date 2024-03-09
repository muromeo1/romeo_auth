require 'interactor'

module Sessions
  class Destroy
    include Interactor
    include BaseInteractor

    requires :token

    def call
      user ? destroy_session : raise_error
    rescue StandardError => e
      context.fail!(error: e.message)
    end

    private

    def user
      @user ||= User.find_by(id: user_id)
    end

    def user_id
      @user_id ||= RomeoAuth::JsonWebToken.decode(token)&.dig(:user_id)
    end

    def destroy_session
      RomeoAuth::JsonWebToken.encode(user_id:)
    end

    def raise_error
      raise 'Invalid token'
    end
  end
end
