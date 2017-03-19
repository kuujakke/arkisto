Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  root 'pictures#index'
  get 'pictures/index'
  resources :pictures
  get 'upload', to: 'pictures#upload'
  post 'pictures', to: 'pictures#create'
end
