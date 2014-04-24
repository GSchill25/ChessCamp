ChessCamp::Application.routes.draw do
  get "locations/index"
  get "locations/show"
  get "locations/new"
  get "locations/edit"
  get "locations/create"
  get "locations/update"
  get "locations/destroy"
  get "students/index"
  get "students/show"
  get "students/new"
  get "students/edit"
  get "students/create"
  get "students/update"
  get "students/destroy"
  get "families/index"
  get "families/show"
  get "families/new"
  get "families/edit"
  get "families/create"
  get "families/update"
  get "families/destroy"
  # generated routes
  resources :curriculums
  resources :instructors
  resources :camps

  # semi-static routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy

  # set the root url
  root to: 'home#index'

end
