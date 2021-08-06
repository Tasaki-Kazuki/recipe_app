Rails.application.routes.draw do
  
  root 'top#index'
  
  
  devise_for :users

  

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "/users/sign_out", :to => "users/sessions#destroy" 
  end



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
