Rails.application.routes.draw do
  devise_for :users
  root 'cards#index'
  resources :users
  resources :cards, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end