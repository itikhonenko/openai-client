# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'logger'

require 'openai/client/version'
require 'openai/client/configuration'
require 'openai/client/configurable'
require 'openai/client/http'
require 'openai/client/models'

module Openai
  module Client
    extend Configurable
  end
end
