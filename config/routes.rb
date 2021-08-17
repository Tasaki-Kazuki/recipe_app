Rails.application.routes.draw do
<<<<<<< HEAD
  resources :resources
  get 'users/index'
  get 'users/show'
=======
>>>>>>> 45d776730a3e0bec1f7c35ba4e1a0d50e0921889
  root 'home#index'
  get 'home/show'
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "/users/sign_out", :to => "users/sessions#destroy"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
