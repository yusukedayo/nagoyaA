Rails.application.routes.draw do
  resources :top_pages
  root to: 'recipes#index'
  resources :users
  resources :recipes do
    resources :comments
    collection do
      get :likes
    end
  end
end
