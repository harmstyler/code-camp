Codecamp::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #Root
  root :to => 'pages#show', :id => 'home'

  #Speakers
  resources :speakers, :only => [ :index ]
  get '/speakers/:slug,:id', to: 'speakers#show', as: 'speaker_slug'
  get '/speakers/:id', to: 'speakers#show', as: 'speaker'

  #Sessions
  resources :sessions, :only => [ :index ]
  get '/sessions/:slug,:id', to: 'sessions#show', as: 'session_slug'
  get '/sessions/:id', to: 'sessions#show', as: 'session'

  #Subscribers
  post '/subscribers', to: 'subscribers#create', as: 'subscribers'
  get '/subscribers/new', to: 'subscribers#new', as: 'new_subscriber'

  #SpeakerSubmissions
  # resources :speaker_submissions, :path => '/submit', :only => [ :new, :create ]
  get '/submit', to: 'speaker_submissions#new', as: 'speaker_submissions'
  post '/submit', to: 'speaker_submissions#create'

  #Schedule
  get '/schedule', to: 'schedule#index'

  #Pages
  get '/location', to: 'high_voltage/pages#show', :id=> 'location'

  # get 'browser' => 'browser#index'


end
