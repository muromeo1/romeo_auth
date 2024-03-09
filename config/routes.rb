RomeoAuth::Engine.routes.draw do
  resources :users, only: [:create]

  resources :sessions, only: [:create] do
    collection do
      delete :destroy
    end
  end
end
