# frozen_string_literal: true

module Openai
  module Client
    class Configuration
      attr_accessor :logger, :access_token, :organization_id, :openai_url

      def initialize
        @openai_url      = 'https://api.openai.com/v1'
        @access_token    = nil
        @organization_id = nil
        @organization_id = nil
        @logger          = Logger.new($stdout)
      end
    end
  end
end
