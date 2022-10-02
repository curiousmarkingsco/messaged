Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  mount ActionCable.server => '/cable'
  mount Messaged::Engine => "/messaged"
end
