Rails.application.routes.draw do

devise_for :staffs, path: 'staffs', controllers: {
    sessions: 'staffs/sessions',
    registrations: 'staffs/registrations',
  }

  # After logout, redirect to the staff sign-in page
  devise_scope :staff do
    get 'staffs/sign_in' => "devise/sessions#new"
    get 'staffs/sign_out' => "devise/sessions#destroy"
  end

  # Wrap devise_for inside devise_scope to specify mappings
  devise_scope :staff do
    # If user is not authenticated, root to the staff sign-in page
    authenticated :staff do
      root to: 'dashboards#dashboard_home_screen', as: 'authenticated_root'
    end

    # If user is authenticated, root to a different page (e.g., dashboard)
    root to: 'staffs/sessions#new', as: 'unauthenticated_root'
  end


  resources :staffs
  resources :manage_schools
  resources :events
  resources :visitors
  resources :salaries
  resources :revenues
  resources :expenditures
  resources :fees
  resources :inventories
  resources :reports
  resources :results
  resources :grades
  resources :assessments
  resources :homeworks
  resources :correspondences
  resources :textbooks
  resources :attendances
  resources :admissions
  resources :recruitments
  resources :schools
  resources :tests
  resources :exams
  resources :subjects
  resources :departments
  resources :classrooms
  resources :parents
  resources :students

  # Set the root path to your application view (application.html.erb)
  # root 'application#application_view'

  # Defines the root path route ("/")
  # root "dashboards#dashboard_screen"
  get 'home_screen', to: 'dashboards#dashboard_home_screen', as: 'dashboard_home_screen'
  get '/students_portal', to: 'students#students_portal'
  get '/parents_portal', to: 'parents#parents_portal'


end
