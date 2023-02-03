# frozen_string_literal: true

require 'logger'

module Openai
  module Client
    class Configuration
      attr_accessor :logger, :access_token, :organization_id

      def initialize
        @access_token    = nil
        @organization_id = nil
        @logger          = Logger.new($stdout)
      end
    end
  end
end
