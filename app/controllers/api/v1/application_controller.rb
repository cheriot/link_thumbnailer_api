module Api
  module V1
    class ApplicationController < ::Api::ApplicationController

      rescue_from ::LinkThumbnailer::BadUriFormat do |e|
        render json: { message: "given url is not valid" }, status: 422
      end

      rescue_from ::LinkThumbnailer::RedirectLimit do |e|
        render json: { message: "given url has too many redirection" }, status: 422
      end

    end
  end
end
