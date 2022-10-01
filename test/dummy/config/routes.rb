Rails.application.routes.draw do
  mount Messaged::Engine => "/messaged"
end
