Rails.application.routes.draw do
  root to: 'items#index'
  get 'messages/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'birthdays', to: 'users/registrations#new_birthday'
    post 'birthdays', to: 'users/registrations#create_birthday'
  end
  resources :users, only: [:index, :new]
  resources :items do
    resources :orders, only: [:index, :create]
    resources :messages, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end