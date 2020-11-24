class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :login

  def login
    token = Authentication.new(params[:email], params[:password]).call
    if token
      response = { token: token, message: Messages.login }
      json_response(response)
    else
      json_response({ error: token.errors }, :unauthorized)
    end
  end

  def logout
    @current_user.tokens.create!(token: @token)
    json_response(message: Messages.logout)
  end
end
