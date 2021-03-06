Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :users, only: %i[new create show]
  resources :expenses, only: %i[index new create]
  resources :groups, only: %i[index new create show]
  get 'signup', to: 'users#new'
  get 'expenses/index_no_group', to: 'expenses#index_no_group'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
