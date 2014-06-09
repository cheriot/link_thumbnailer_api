require 'options_parser'

module Api
  module V1
    class ThumbnailsController < ::Api::V1::ApplicationController

      skip_before_action :verify_authenticity_token, only: :new

      def new
        @thumbnail = ::LinkThumbnailer.generate(params[:url], options)

        render json: @thumbnail, callback: params['callback']
      end

      private

      def options
        ::OptionsParser.new(options_params).call
      end

      def options_params
        params.fetch(:options, {})
      end

    end
  end
end
