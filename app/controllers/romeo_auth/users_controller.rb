module RomeoAuth
  class UsersController < ApplicationController
    def create
      result = ::Users::Create.call(user_params)

      if result.success?
        render json: { token: result.token }, status: :created
      else
        render json: { error: result.error }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
