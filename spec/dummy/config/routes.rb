Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount RomeoAuth::Engine => '/'

      resources :posts, only: [:index]
    end
  end
end
