Rails.application.routes.draw do
  root to: 'doctors#index'

  devise_for :patients
  devise_for :doctors, defaults: { format: :json }, controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations'
  }

  resources :specialties, only: [:index]
  get '/appointments', to: 'appointments#index'
  get '/patient_appointments', to: 'appointments#patient_index'

  resources :doctors, only: [:index, :show]
  put '/doctor', to: 'doctors#update'

  resources :patients, only: [:show, :edit]
  put '/schedule', to: 'schedules#update'
  get '/schedule', to: 'schedules#show'

  get '/reviews', to: 'reviews#index'
end
