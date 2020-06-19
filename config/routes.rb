Rails.application.routes.draw do
  devise_for :users
  root 'memos#index'
  resources :memos do
    collection do
      get 'pagenation'
    end
  end
  resources :notes
  resources :relationships, only: [:create, :destroy]
end