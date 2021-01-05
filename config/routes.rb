Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'birthdays', to: 'users/registrations#new_birthday'
    post 'birthdays', to: 'users/registrations#create_birthday'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :users, only: [:index, :new]
  resources :items do
    resources :orders, only: [:index, :create]
    resources :messages, only: [:new, :create]
  end
end