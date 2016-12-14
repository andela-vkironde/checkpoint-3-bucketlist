class JsonWebToken
 def self.encode(payload, expiration = 12.hours.from_now)
   payload[:exp] = expiration.to_i
   JWT.encode(payload, Rails.application.secrets.secret_key_base)
 end

 def self.decode(token)
   body = JWT.decode(token, Rails.application.secrets.secret_key_base).first
   HashWithIndifferentAccess.new body
 rescue JWT::ExpiredSignature => e
   @current_user.tokens.create!(token: token)
   raise ExceptionHandler::ExpiredToken, e.message
 end
end
