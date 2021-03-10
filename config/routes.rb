Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    
    namespace :public do
      resource :courses, only: %i[show index]
    end

    namespace :students do
      resources :courses, only: %i[show index]
      resources :users, only: [:show]
      resources :session_attendees
    end

    namespace :teachers do
      resources :session_attendees, only: %i[show index update]
      resources :courses, only: %i[show index]
    end

    namespace :admins do
      resources :categories
      resources :course_sessions
      resources :users
      resources :session_attendees
      resources :courses
      resources :classrooms
    end
  end

  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/login',
               sign_out: 'api/logout',
               registration: 'api/signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
end
