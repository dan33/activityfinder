ActivityFinder::Application.routes.draw do
	devise_for :users

	root :to => "home#index"

	resources :categories, :only => [:show, :index]

	get '/users/profile' => "users#show"
	post '/search/' => "activities#locate"

	resources :memberships

	resources :users, :only => [:show]

	resources :activities, :only => [:new, :create, :index, :show]

end