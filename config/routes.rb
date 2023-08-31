Rails.application.routes.draw do
  # Use devise_for to set up user authentication routes
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get 'users/sign_in' => "devise/sessions#new"
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  resources :dashboards
  resources :tests
  resources :exams
  resources :subjects
  resources :departments
  resources :classrooms
  resources :parents
  resources :students
  resources :staffs

  # Defines the root path route ("/")
  root "dashboards#dashboard_screen"
end
