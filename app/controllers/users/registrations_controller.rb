class Users::RegistrationsController < Devise::RegistrationsController
  before_action :redirect_if_authenticated, only: [ :new, :create ]
end
