module ExceptionHandler
  extend ActiveSupport::Concern

  class AccessDenied < StandardError; end
  class UserNotFound < StandardError; end
  class NotAuthorized < StandardError; end

  included do
    rescue_from ExceptionHandler::AccessDenied, with: :access_denied
    rescue_from ExceptionHandler::NotAuthorized, with: :access_denied
    rescue_from ExceptionHandler::UserNotFound, with: :user_not_found

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end
  end

  private

  def access_denied(e)
    json_response({ message: e.message }, :unauthorized)
  end

  def user_not_found(e)
    json_response({ errors: e.message }, :not_found)
  end
end
