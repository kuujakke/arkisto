Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users
  get 'pictures/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pictures#index'
end
