Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  root 'pictures#index'
  resources :pictures
end
