Rails.application.routes.draw do
  resources :articles
  # get 'articles' => 'articles#index'
  # get 'articles/:id' => 'articles#show'
  # post 'articles' => 'articles#create'
  # patch 'articles/:id' =>  'articles#update'
  # delete 'articles/:id' => 'articles#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
end