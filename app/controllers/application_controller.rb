class ApplicationController < ActionController::API
  include Authenticable
  include Pagy::Backend
  include Pundit::Authorization

  rescue_from Errors::UnauthorizedError, with: :render_error
  rescue_from Pundit::NotAuthorizedError, with: :render_error

  private

  def render_error(err)
    render "api/errors", status: :unauthorized, locals: { code: 2, message: err }
  end
end
