require 'link_thumbnailer'

class Thumbnails < Grape::API
  format :json

  use Rack::JSONP

  resource 'thumbnails' do

    params do
      requires :url, type: String, desc: "The website URL to generate thumbnail for"
    end

    get '/new' do
      options = ::OptionsParser.new(params.fetch('options', {})).call
      ::LinkThumbnailer.generate(params['url'], options)
    end

  end
end
