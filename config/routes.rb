Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#recruitment_dashboard', as: "dashboard"
  get '/profile', to: 'pages#my_profile', as: 'profile'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs do
    member do
      get "/applicants", to: 'job_applications#applicants_show'
    end
    resources :job_applications do
      resources :interviews, only: [:index, :new, :create, :show, :update, :edit]
    end
  end
end
