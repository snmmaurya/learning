Rails.application.routes.draw do
  resources :welcome, only: [:index]

  root "welcome#index"

  # resources :animals
  resources :lions, controller: "animals", type: "Lion" # type is extra parameter with value Lions
  resources :horses, controller: "animals", type: "Horse" # type is extra parameter with value Horse

  namespace :snm do
	  resources :custom do
	  	collection do
	  		get :stream
	  	end
	  end
	end

	get "/custompath", to: "welcome#index"#, as: 'itsme'

	# Remove snm namespace from url
	# without scope - /snm/custom/stream
	# with scope /custom/stream
	scope module: 'snm' do # alias # scope '/snm' do
		resources :custom do
			collection do
	  		get :stream
	  	end
		end
	end

	# scope 'cherry' do
	# 	resources :blossom
	# end

	# WILL GENERATE FOLLOWING
	# blossom_index GET    /cherry/blossom(.:format)          blossom#index
	#               POST   /cherry/blossom(.:format)          blossom#create
	#   new_blossom GET    /cherry/blossom/new(.:format)      blossom#new
	#  edit_blossom GET    /cherry/blossom/:id/edit(.:format) blossom#edit
	#       blossom GET    /cherry/blossom/:id(.:format)      blossom#show
	#               PATCH  /cherry/blossom/:id(.:format)      blossom#update
	#               PUT    /cherry/blossom/:id(.:format)      blossom#update
	#               DELETE /cherry/blossom/:id(.:format)      blossom#destroy


	# scope module: 'snm' do
	# 	resources :blossom
	# end
	# WILL GENERATE FOLLOWING

	# blossom_index GET    /blossom(.:format)             snm/blossom#index
	#               POST   /blossom(.:format)             snm/blossom#create
	#   new_blossom GET    /blossom/new(.:format)         snm/blossom#new
	#  edit_blossom GET    /blossom/:id/edit(.:format)    snm/blossom#edit
	#       blossom GET    /blossom/:id(.:format)         snm/blossom#show
	#               PATCH  /blossom/:id(.:format)         snm/blossom#update
	#               PUT    /blossom/:id(.:format)         snm/blossom#update
	#               DELETE /blossom/:id(.:format)         snm/blossom#destroy


	# scope module: 'snm', path: 'prefix' do
	# 	resources :blossom
	# end
	# WILL GENERATE FOLLOWING

	# blossom_index GET    /prefix/blossom(.:format)          snm/blossom#index
	#               POST   /prefix/blossom(.:format)          snm/blossom#create
	#   new_blossom GET    /prefix/blossom/new(.:format)      snm/blossom#new
	#  edit_blossom GET    /prefix/blossom/:id/edit(.:format) snm/blossom#edit
	#       blossom GET    /prefix/blossom/:id(.:format)      snm/blossom#show
	#               PATCH  /prefix/blossom/:id(.:format)      snm/blossom#update
	#               PUT    /prefix/blossom/:id(.:format)      snm/blossom#update
	#               DELETE /prefix/blossom/:id(.:format)      snm/blossom#destroy
	# end

	require 'sidekiq/web'
	mount Sidekiq::Web, at: '/sidekiq'
end