Rails.application.routes.draw do
  get 'visitors/index'

  namespace :api do
    namespace :v1 do
      post 'page' => 'pages#store_content'
      get 'urls' => 'pages#urls'
    end
  end
end
