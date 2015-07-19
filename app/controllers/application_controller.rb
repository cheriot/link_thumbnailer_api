class ApplicationController < ActionController::API
  include ActionController::RespondWith

  respond_to :json

  rescue_from ::LinkThumbnailer::Exceptions, with: :bad_request
  rescue_from ::ActionController::ParameterMissing, with: :bad_request
  rescue_from ::Net::HTTPServerException, with: :forbidden
  rescue_from ::NameError, with: :bad_request

  def not_found
    head :not_found
  end

  def bad_request
    head :bad_request
  end

  def forbidden
    head :forbidden
  end

end
