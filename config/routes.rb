Rails.application.routes.draw do

    root "events#index"

  devise_for :users
  resources :users
  resources :events

  resources :events do
    resources :attendances
    resources :pictures, only: [:create]

  end

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

end
