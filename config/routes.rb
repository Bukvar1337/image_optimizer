Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  post '/images/compress', to: 'images#compress'
  get '/images/:id/download', to: 'images#download'
end

