Rails.application.routes.draw do

  devise_for :users
  
  root 'memos#index'
  resources :notes, except: [:index, :show] do
    # resources :likes, only: [:create, :destroy]
    # resources :comments, only: [:create, :destroy]
  end
  
  resources :memos, only: [:index] do
    collection do
      get 'pagenation'
      get 'timeline'
    end
  end

  namespace :api do
    resources :memoforms, only: [:index, :create, :update], defaults: { format: 'json' }
    resources :relationships, only: [:index, :create, :destroy], defaults: { format: 'json' }
    resources :likes, only: [:create, :destroy], defaults: { format: 'json'}
    resources :comments, only: [:create, :destroy], defaults: { format: 'json'}
  end



end