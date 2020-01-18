Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  devise_for :users, controllers: {
        sessions:      'users/sessions',
        passwords:     'users/passwords',
        registrations: 'users/registrations'
    }

    get 'home/index'
    root to: "books#top"
  resources :books, only: [:new, :create, :index, :show]
  resources :users, only:[:show, :edit, :update, :index]
    # For details on the DSL available within this file,
    # see http://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
