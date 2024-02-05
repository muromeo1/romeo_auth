require 'interactor'

module Sessions
  class Create
    include Interactor
    include BaseInteractor

    requires :email, :password

    def call
      user_authenticated? ? return_token : raise_error
    rescue StandardError => e
      context.fail!(error: e.message)
    end

    private

    def user
      @user ||= User.find_by(email:)
    end

    def user_authenticated?
      user&.authenticate(password)
    end

    def return_token
      context.token = RomeoAuth::JsonWebToken.encode(user_id: user.id)
    end

    def raise_error
      raise 'Invalid credentials'
    end
  end
end
