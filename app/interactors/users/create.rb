require 'interactor'
require 'pry'

module Users
  class Create
    include Interactor
    include BaseInteractor

    requires :name,
             :email,
             :password,
             :password_confirmation

    def call
      user_exists?
      create_user
      authenticate_user
    rescue StandardError => e
      context.fail!(error: e.message)
    end

    private

    def user
      @user ||= User.find_by(email:)
    end

    def user_exists?
      raise 'Email already registered' if user.present?
    end

    def create_user
      context.user = User.create(context.to_h.merge({ email: }))
    end

    def authenticate_user
      context.token = Users::Authenticate.call(email:, password:).token
    end
  end
end
