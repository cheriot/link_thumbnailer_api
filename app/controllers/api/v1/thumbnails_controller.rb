require 'options_parser'

module Api
  module V1
    class ThumbnailsController < ::Api::V1::ApplicationController

      def new
        @thumbnail = ::LinkThumbnailer.generate(params[:url], options)

        respond_with @thumbnail
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
