module RomeoAuth
  class SessionsController < ApplicationController
    def create
      result = Sessions::Create.call(session_params)

      if result.success?
        render json: { token: result.token }, status: :created
      else
        render json: { error: result.error }, status: :unprocessable_entity
      end
    end

    def destroy
      result = Sessions::Destroy.call(token:)

      if result.success?
        render json: { message: 'Session destroyed' }, status: :ok
      else
        render json: { error: result.error }, status: :unprocessable_entity
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
