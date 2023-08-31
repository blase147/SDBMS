Rails.application.routes.draw do
  devise_for :users
  resources :dashboards
  resources :tests
  resources :exams
  resources :subjects
  resources :departments
  resources :classrooms
  resources :parents
  resources :students
  resources :staffs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#dashboard_screen"
end
