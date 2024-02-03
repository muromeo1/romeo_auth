module Api
  module V1
    class PostsController < ApplicationController
      before_action :authorize!

      def index
        render json: { user: current_user }
      end
    end
  end
end
