module Helpers
  def json
    JSON.parse(response.body)
  end

  def token(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def expired_token(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def valid_headers(user_id)
    headers.merge("Authorization" => token(user_id))
  end

  def headers
    {
      "Accept" => "application/vnd.bctlst.v1+json"
    }
  end
end
