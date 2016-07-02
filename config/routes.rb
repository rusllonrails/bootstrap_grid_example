Rails.application.routes.draw do

  resources :providers, only: [:index, :create, :update, :destroy] do
    put :toggle
  end

  get 'home/index'

  root 'home#index'
end
