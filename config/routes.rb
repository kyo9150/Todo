Rails.application.routes.draw do
  devise_for :users
  root "tags#index"
  resources :users, only: [:edit, :update]
  resources :tags, only: [:index,:new, :create,:destroy] do
    resources :tasks
  end
  post '/tasks/:id/done' => 'tasks#done',   as: 'done'
end