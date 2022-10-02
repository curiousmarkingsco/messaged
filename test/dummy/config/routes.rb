Rails.application.routes.draw do
  mount Messaged::Engine => "/messaged"
  root to: "messaged/messages#index"
end
