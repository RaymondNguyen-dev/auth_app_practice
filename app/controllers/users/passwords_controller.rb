class Users::PasswordsController < Devise::PasswordsController
  before_action :redirect_if_authenticated, only: [ :new, :create, :edit, :update ]
end
