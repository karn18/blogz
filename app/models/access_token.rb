class AccessToken < ApplicationRecord
  belongs_to :user

  validates :token, uniqueness: true

  scope :find_valid_token, (->(token) do
    includes(:user).find_by("token = :token and expiry_at > :current_time", token: token, current_time: DateTime.now)
  end)
end
