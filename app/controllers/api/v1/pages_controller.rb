module Api
  module V1
    class PagesController < ApplicationController
      # before_action :authenticate_jwt

      def index
        raise StandardError, "Bug here"
      end

      def health
        render status: :ok
      end
    end
  end
end
