ActivityFinder::Application.routes.draw do
  devise_for :users

  root :to => "home#index"


  resources :memberships, :only => [:create, :destroy]
  resources :users, :only => [:index, :show]
  resources :activities, :only => [:new, :create, :index, :show]
end
