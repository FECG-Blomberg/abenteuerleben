# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :campyears do
  #   resources :camps, shallow: true
  # end

  # get '/teams/catalogue/:id', to: 'teams#catalogue', as: 'teams_catalogue'

  ############################
  # helper registration related
  ############################
  # resources :helpers
  # get '/excel/helpers', to: 'helpers#excelify'
  # get '/mitarbeiteranmeldung', to: 'helpers#new'
  # --------------------------

  ############################
  # child registration related
  ############################
  # get '/kinderanmeldung', to: 'parent/parents#index'
  # get '/parents/:id/resend_verification_mail', to: 'parent/parents#resend_registration_email'
  # get '/excel/children', to: 'children#excelify'
  # namespace :parent do
  #   resources :names, only: %i[new create]
  #   resources :locations, only: %i[new create]
  #   resources :contacts, only: %i[new create]
  #   resources :optionals, only: %i[new create]
  #   resources :child_stats, only: %i[new create]
  #   resources :parents, only: %i[index new create edit update]
  # end

  # resources :children
  # --------------------------

  get 'admin/dashboard'
  # get 'admin/dev'

  # Login / Logout
  get 'login', to: 'session#login'
  post 'login', to: 'session#auth'
  get 'logout', to: 'session#logout'

  # Downloads
  get 'downloads', to: 'downloads#index'
  get 'admin/downloads', to: 'downloads#admin'
  get 'admin/downloads/new', to: 'downloads#new'
  post 'admin/downloads', to: 'downloads#create'
  get 'admin/downloads/:id', to: 'downloads#show'
  post 'admin/downloads/:id', to: 'downloads#update', as: :admin_download
  # delete 'admin/downloads/:id', to: 'downloads#destroy'

  resources :messages
  get 'admin/messages', to: 'messages#index'
  get 'admin/message/:id', to: 'messages#show', as: :admin_message
  delete 'admin/message/:id', to: 'messages#destroy'

  get 'pages/:id', to: 'pages#show', as: :page

  namespace :admin do
    resources :pages, except: [ :show ]
    resources :events, only: [ :index, :new, :create, :edit, :update, :destroy ]
    resources :teams
  end

  resources :events, only: [ :index, :show ]

  root 'home#index'
end
