module Helpers
  def json
    JSON.parse(response.body)
  end

  def token(user)
    user.tokens.create(token: JsonWebToken.encode(user_id: user.id))
  end

  def expired_token(user)
    JsonWebToken.encode({ user_id: user.id }, (Time.now.to_i - 10))
  end

  def invalid_user_token(id)
    JsonWebToken.encode({ user_id: id }, (Time.now.to_i + 10))
  end

  def default_headers
    {
      accept: 'application/vnd.justdoit.v1+json'
    }
  end

  def valid_headers(user)
    default_headers.merge(authorization: token(user).token)
  end

  def invalid_headers(token = nil)
    default_headers.merge(authorization: token)
  end
end
