Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy] 
      resources :videos_room, only: [:index, :show, :create, :update, :destroy] 
      resources :user_videos_room, only: [:index, :show, :create, :update, :destroy] 
      resources :playlist, only: [:index, :show, :create, :update, :destroy] 
    end
  end
end
