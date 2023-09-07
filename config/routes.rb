Rails.application.routes.draw do
  
   # Use devise_for to set up user authentication routes
   devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  devise_scope :user do
    delete 'users/sign_out' => "devise/sessions#destroy"
  end

  devise_for :staffs, path: 'staffs', controllers: {
    sessions: 'staffs/sessions',
    registrations: 'staffs/registrations',
  }
 
  
# After logout, redirect to the staff sign-in page
devise_scope :staff do
  delete 'staffs/sign_out' => "devise/sessions#destroy"
end


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
  resources :staffs
  
  # Defines the root path route ("/")
  root "dashboards#dashboard_screen"
  get 'home_screen', to: 'dashboards#dashboard_home_screen', as: 'dashboard_home_screen'
  get '/students_portal', to: 'students#students_portal'
  get '/parents_portal', to: 'parents#parents_portal'

end
