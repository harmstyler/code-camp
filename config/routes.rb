Codecamp::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #Root
  root :to => 'high_voltage/pages#show', :id => 'home'

  #Speakers
  resources :speakers, :only => [ :show, :index ]

  #Sessions
  resources :sessions, :only => [ :show, :index ]

  #Subscribers
  resources :subscribers

  #SpeakerSubmissions
  # resources :speaker_submissions, :path => '/submit', :only => [ :new, :create ]
  get '/submit', to: 'speaker_submissions#new', as: 'speaker_submissions'
  post '/submit', to: 'speaker_submissions#create'

  #Schedule
  get '/schedule', to: 'schedule#index'

  #Pages
  get '/location', to: 'high_voltage/pages#show', :id=> 'location'

  get 'browser' => 'browser#index'


end
