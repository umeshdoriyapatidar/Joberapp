Rails.application.routes.draw do
  resources :jobs
  resources :employees 
  resources :applicants
  devise_for :employees
  devise_for :applicants
  devise_scope :applicant do
    get 'sign_in', to: 'devise/sessions#new'
  end
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
