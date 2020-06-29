Rails.application.routes.draw do

  devise_for :users
  
  root 'memos#index'
  
  resources :memos, only: [:index, :create] do
    collection do
      get 'pagenation'
    end
  end

  namespace :api do
    resources :memoforms, only: [:index, :update], defaults: { format: 'json' }
    resources :relationships, only: [:index, :create, :destroy], defaults: { format: 'json' }
  end

  resources :notes, except: [:index, :show]

end