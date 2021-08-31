Rails.application.routes.draw do
  root 'home#index'
  get "/recipes/search", :to => "recipes#search"
  resources :recipes
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "/users/sign_out", :to => "users/sessions#destroy"
  end
  resources :seasons
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
