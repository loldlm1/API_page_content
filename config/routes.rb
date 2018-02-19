Rails.application.routes.draw do
  get 'visitors/index'

  namespace :api, defaults: { format: :json } do
    get '/content' => 'pages#content'
    get '/urls' => 'pages#urls'
  end
end
