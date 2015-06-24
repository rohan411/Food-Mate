Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  get '/status' => 'application#status'
end
