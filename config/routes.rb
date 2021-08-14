Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
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
