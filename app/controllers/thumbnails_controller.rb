require 'options_parser'

class ThumbnailsController < ApplicationController

  def new
    @thumbnail = ::LinkThumbnailer.generate(params[:url], options)

    render json: @thumbnail, callback: params[:callback]
  rescue ::URI::InvalidURIError, ::Net::HTTPServerException => e
    render json: { error: e.message }, callback: params[:callback], status: 422
  rescue ::LinkThumbnailer::Exceptions => e
    render json: { error: e.message }, callback: params[:callback], status: 400
  end

  private

  def options
    ::OptionsParser.new(params.fetch(:options, {})).call
  end

  def permitted_params
    params.require(:url)
    params.permit(options: [])
  end

end
