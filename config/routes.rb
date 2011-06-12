Helpatraveler::Application.routes.draw do

  get "users/new"

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'

  devise_for :users
  match 'settings', :as=>:current_user, :controller=>:users, :action=>:index, :via=>:get
  match 'settings', :as=>:current_user, :controller=>:users, :action=>:update, :via=>[:post, :put]

  root :to => 'pages#home'
end
