Rails.application.routes.draw do
  root "sessions#new"

  devise_for :users, controllers: {
  sessions: "users/sessions",
  registrations: "users/registrations",
  passwords: "users/passwords"
}
end
