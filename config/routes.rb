Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :movies
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:index, :show, :new, :create, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
