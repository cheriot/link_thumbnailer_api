module Api
  class ApplicationController < ::ApplicationController

    respond_to :json

    def ping
      render nothing: true, status: 200
    end

  end
end
