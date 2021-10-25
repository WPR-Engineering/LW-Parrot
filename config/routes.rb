Rails.application.routes.draw do
  resources :audio_channels

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
end
