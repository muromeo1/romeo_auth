Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount RomeoAuth::Engine => '/'
    end
  end
end
