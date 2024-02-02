module RomeoAuth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_migrations
        rake 'romeo_auth:install:migrations'
      end
    end
  end
end
