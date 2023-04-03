Rails.application.routes.draw do
  devise_for :doctors, defaults: { format: :json }, controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations'
  }

  resources :specialties, only: [:index]
end
