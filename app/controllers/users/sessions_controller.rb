class Users::SessionsController < Devise::SessionsController
  before_action :redirect_if_authenticated, only: [ :new, :create ]
end
