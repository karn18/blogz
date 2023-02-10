module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.authenticate(params["username"], params["password"])
        unless user
          return render "api/errors", status: :unauthorized,
            locals: { code: 1, message: I18n.t("api.errors.username_or_password_is_wrong") }
        end

        token = user.generate_jwt
        render "api/v1/sessions/create", status: :ok, locals: { user: user, token: token }
      rescue ActiveRecord::StatementInvalid
        render "api/errors", status: :internal_server_error,
          locals: { code: 3, message: I18n.t("api.errors.something_went_wrong") }
      end
    end
  end
end
