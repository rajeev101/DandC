Rails.application.routes.draw do
  get 'topic/index'
  get 'topic/create'
  get '/topic/show/:id', to: 'topic#show', as: 'topic_show'
  get 'super_sub_categories/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :learnings do
    get 'more/:category_id', to: 'learnings#more', as: 'more'
  end
  resources :courses do
    resource :syllabus
  end
   get '/generate_pdf', to: 'pdf#generate_pdf', as: 'generate_pdf'
  root 'learnings#index'
  resources :categories
  resources :subcategories
  resources :syllabus
  resources :syllabuses
  resources :registration, only: [:new, :create, :index]
  resources :contacts
  resources :recommendations
  resources :instructors
  resources :faqs
  resources :courses
  resources :learnings
  get 'Advantage', to: 'learnings#Advantage',as: 'Advantage'
  get 'terms', to: 'learnings#terms', as: "terms"
  get 'privacy', to: 'learnings#privacy', as: "privacy"
  get 'refund', to: 'learnings#refund', as: "refund"
  get 'jobs', to: 'learnings#jobs', as: 'jobs'
  get 'procast', to: 'learnings#procast', as: 'procast'
  get 'login', to: 'learnings#login', as: 'login'
  get 'more', to: 'learnings#more', as: 'more'
  get 'pdf', to: 'learnings#pdf', as: 'pdf'
  get 'topic', to: 'learnings#topic', as: 'topic'
  # get '/topics/:id', to: 'topics#show', as: 'show_topic'

  resources :accounts, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/forgot_password', to: 'password_resets#new', as: 'forgot_password'
  post '/forgot_password', to: 'password_resets#create'
  get '/password_reset/:token/edit', to: 'password_resets#edit', as: 'edit_password_reset'
  patch '/password_reset/:token', to: 'password_resets#update'
end