Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :users
  resources :recipes do
    resources :comments
    collection do
      get :likes
    end
  end
end
