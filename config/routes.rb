Rails.application.routes.draw do

  resources :providers, only: [:index, :create, :update, :destroy] do
    put :toggle

    collection do
      post :turn_on
      post :turn_off
    end
  end

  get 'home/index'

  root 'home#index'
end
