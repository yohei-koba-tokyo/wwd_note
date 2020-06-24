Rails.application.routes.draw do

  devise_for :users
  
  root 'memos#index'
  
  resources :memos, only: [:index, :create] do
    collection do
      get 'pagenation'
    end
  end

  resources :notes, except: [:index, :show]
  
  namespace :api do
    resources :relationships, only: [:index], defaults: { format: 'json' }
  end

  resources :relationships, only: [:create, :destroy]

end