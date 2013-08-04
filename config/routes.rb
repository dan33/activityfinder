ActivityFinder::Application.routes.draw do
	devise_for :users

	root :to => "home#index"

	resources :categories, :only => [:show, :index]

	get '/users/profile' => "users#profile"

	resources :memberships

	resources :users, :only => [:show]

	resources :activities, :only => [:new, :create, :index, :show]


	# devise_for :users

	# root :to => "home#index"

	# resources :categories, :only => [:show, :index]

	# get '/users/profile' => "users#profile"

	# resources :activities, :only => [:create]

	# get '/activity_id' => "activity#show" do
	#  resources :users, :only => [:index, :show]
	#  resources :comments, :only => [:index]
	# end

	# get '/new' => "activity#new"

end