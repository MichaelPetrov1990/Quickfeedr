Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#recruitment_dashboard', as: "dashboard"
  get '/profile', to: 'pages#my_profile', as: 'profile'
  get '/applicant_profile/:id', to:'pages#applicant_profile', as:"applicant_profile"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs do
    resources :job_applications do
      resources :interviews, only: [:index, :new, :create, :show, :update, :edit]
    end
  end
end
