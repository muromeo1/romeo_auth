module RomeoAuth
  class SessionsController < ApplicationController
    def create
      result = Users::Authenticate.call(session_params)

      if result.success?
        render json: { token: result.token, status: 201 }
      else
        render json: { error: result.error, status: 422 }
      end
    end

    private

    def session_params
      params.permit(
        :email,
        :password
      )
    end
  end
end
