require 'newrelic_rpm'
require_relative '../lib/options_parser'

NewRelic::Agent.manual_start(env: Goliath.env.to_s)
