Rails.application.routes.draw do
  devise_for :users
  root "tasks#doing"
  resources :users, only: [:edit, :update]
  resources :tags, only: [:index,:new, :show,:create,:destroy] do
    resources :tasks do
      member do
        put "finish"
      end
    end
  end
  get  "tasks/done"  => "tasks#done"
  get  "tasks/doing"  => "tasks#doing"
  get  "tasks/calendar"  => "tasks#calendar"
end
