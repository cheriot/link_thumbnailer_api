require 'rubygems'
require 'bundler/setup'
require 'goliath'
require 'goliath/plugins/latency'
require 'rack/contrib'
require 'rack/fiber_pool'
require 'grape'

require './app/apis/thumbnails'

class Application < Goliath::API

  use(
    Rack::Static,
    root: Goliath::Application.app_path('public'),
    urls: ['/favicon.ico', '/stylesheets', '/javascripts', '/images']
  )

  plugin Goliath::Plugin::Latency

  def recent_latency
    Goliath::Plugin::Latency.recent_latency
  end

  def response(env)
    case env['PATH_INFO']
    when '/'
      [200, {}, '']
    else
      ::Thumbnails.call(env)
    end
  end

end
