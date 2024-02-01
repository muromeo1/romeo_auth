module RomeoAuth
  class Engine < ::Rails::Engine
    isolate_namespace RomeoAuth
    config.generators.api_only = true
  end
end
