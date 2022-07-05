Rails.application.routes.draw do
  get 'applies/index'
  post 'applies/create'
  delete 'applies/destroy'
  get 'applies/show'
  resources :jobs
  get 'applied_job', to:'jobs#applied_job'
  get 'employees/index'
  get 'employees/new'
  get 'employees/show'
  get 'employees/create'
  get 'employees/edit'
  get 'employees/update'
  get 'employees/destroy'
  get 'applicants/index'
  get 'applicants/new'
  get 'applicants/show'
  get 'applicants/create'
  get 'applicants/edit'
  get 'applicants/update'
  get 'applicants/destroy'
  get 'employees/new'
  get 'applies/status'
  devise_for :employees
  devise_for :applicants
  devise_scope :applicant do
    get 'sign_in', to: 'devise/sessions#new'
  end
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
