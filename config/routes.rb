Rails.application.routes.draw do
  root "dashboards#dashboard_screen"
  
  # Defines the root path route ("/")
  get 'home_screen', to: 'dashboards#dashboard_home_screen', as: 'dashboard_home_screen'

    # Use devise_for to set up user authentication routes
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get 'users/sign_in' => "devise/sessions#new"
    get 'users/sign_out' => "devise/sessions#destroy"
  end

    resources :tests
    resources :exams
    resources :subjects
    resources :departments
    resources :classrooms
    resources :parents
    resources :students
    resources :staffs
    
end
