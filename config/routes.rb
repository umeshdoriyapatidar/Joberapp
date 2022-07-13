Rails.application.routes.draw do
  get 'applies/index'
  post 'applies/filter', to:'applies#filter'
  get 'applies/create'
  delete 'applies/destroy'
  get 'applies/show'
  get 'applies/verify' ,to:'applies#verify'
  get '/verifyotp', to:'applies#verifyotp'
  # resources :applies
  resources :jobs
  get 'applied_job', to:'jobs#applied_job'
  get 'applicants/index'
  get 'applicants/new'
  get 'applicants/show'
  get 'applicants/create'
  get 'employees/new'
  get 'applies/accept'
  get 'applies/rejected'
  get 'search', to: 'applicants#index'
  devise_for :employees
  devise_for :applicants 
  devise_scope :applicant do
    get 'sign_in', to: 'devise/sessions#new'
  end
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
