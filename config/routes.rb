Rails.application.routes.draw do
  root "sessions#new"

  devise_for :users
end
