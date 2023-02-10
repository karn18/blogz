module Authenticable
  extend ActiveSupport::Concern

  included do
    include ActionController::HttpAuthentication::Token::ControllerMethods
  end

  def current_user
    Current.user ||= authenticate_user
  end

  def authenticate_jwt
    user = authenticate_with_http_token do |token|
      access_token = AccessToken.find_valid_token(token)
      access_token.user
    end
    raise Errors::UnauthorizedError, "Missing Access Token" unless user

    Current.user = user
  end
end
