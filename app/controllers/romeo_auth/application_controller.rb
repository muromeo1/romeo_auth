module RomeoAuth
  class ApplicationController < ActionController::API
    def current_user
      @current_user ||= authorize_token.user
    end

    def authorize!
      return current_user if authorize_token.success?

      render json: { error: authorize_token.error }, status: :unprocessable_entity
    end

    private

    def authorize_token
      @authorize_token ||= Sessions::AuthorizeToken.call(
        token: request.headers['Authorization']
      )
    end
  end
end
