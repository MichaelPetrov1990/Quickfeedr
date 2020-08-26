Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#recruitment_dashboard', as: "dashboard"
  get '/profile', to: 'pages#my_profile', as: 'profile'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs do
    resources :job_applications
  end
end
