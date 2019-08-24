Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products
    	resources :notifications
      mount ActionCable.server => "/cable"
    end
  end
end
