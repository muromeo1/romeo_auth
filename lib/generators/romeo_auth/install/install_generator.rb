module RomeoAuth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_migrations
        rake 'romeo_auth:install:migrations'
      end

      def copy_initializer
        copy_file 'initializer_template.rb', 'config/initializers/romeo_auth.rb'
      end

      def copy_user_model
        copy_file 'user_template.rb', 'app/models/user.rb'
      end

      def copy_routes
        copy_file 'routes_template.rb', 'config/routes.rb'
      end
    end
  end
end
