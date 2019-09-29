Rails.application.routes.draw do
  root "static_pages#home"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :courses, except: :destroy
    resources :subjects
  end

  resources :users, except: :destroy
  resources :courses
  resources :course_management_users, only: :create
  resources :tasks
  resources :subjects
end
