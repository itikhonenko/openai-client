# frozen_string_literal: true

require 'openai/client/version'
require 'openai/client/configurable'

module Openai
  module Client
    class Error < StandardError; end

    extend Configurable
  end
end
