require "json_web_token"

class User < ApplicationRecord
  TWENTY_FOUR_HOURS = 24

  after_create :assign_default_role

  has_secure_password
  rolify

  with_options on: :create do
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return user if user&.authenticate(password)
  end

  def assign_default_role
    add_role(:user) if roles.blank?
  end

  def generate_jwt
    expiry_at = TWENTY_FOUR_HOURS.hours.from_now
    token = JsonWebToken.encode({ sub: id, name: username }, expiry_at)
    AccessToken.create(user: self, token: token, expiry_at: expiry_at)
    token
  end
end
