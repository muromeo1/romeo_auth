module RomeoAuth
  class ApplicationController < ActionController::API
    include Auth::Helper
  end
end
