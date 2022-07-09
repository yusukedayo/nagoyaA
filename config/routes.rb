Rails.application.routes.draw do
  # root 'recipes#index'
  resources :users
  resources :recipes do
    resources :comments
    collection do
      get :likes
    end
  end
end
