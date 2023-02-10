require "json_web_token"

class User < ApplicationRecord
  after_create :assign_default_role

  has_secure_password
  rolify

  validates :password, confirmation: true, length: { in: 6..20 }, on: :create

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return user if user&.authenticate(password)
  end

  def assign_default_role
    add_role(:user) if roles.blank?
  end

  def generate_jwt
    expiry_at = 24.hours.from_now
    token = JsonWebToken.encode({ sub: id, name: username }, expiry_at)
    AccessToken.create(user: self, token: token, expiry_at: expiry_at)
    token
  end
end
