ChessCamp::Application.routes.draw do
  # generated routes
  resources :curriculums
  resources :instructors
  resources :camps
  resources :families
  resources :locations
  resources :students
  resources :users
  resources :sessions

  
  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  # semi-static routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/admin', to: 'home#admin', as: :admin
  get 'home/instructor_dash', to: 'home#instructor_dash', as: :instructor_dash

  # set the root url
  root to: 'home#index'

end
