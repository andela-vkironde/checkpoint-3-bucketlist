class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    user = User.new(user_params)
    if user.save
      token = Authentication.new(user.email, user.password).call
      response = { message: Messages.signup_successful,
                   token: token }
      json_response(response, :created)
    else
      json_response({ message: Messages.signup_failed }, :unprocessable_entity)
    end
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
