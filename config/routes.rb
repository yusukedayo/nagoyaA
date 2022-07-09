Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'recipes#index'
resources :users
get 'login', to: 'user_sessions#new'
post 'login', to: 'user_sessions#create'
delete 'logout', to: 'user_sessons#destroy'
resources :recipes do
	resources :comments
	collection do 
		get :likes
	end
end
end
