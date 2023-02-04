# frozen_string_literal: true

module Openai
  module Client
    module Configurable
      # @api public
      # Public: Returns the instance of Configuration class
      #
      # @return [Openai::Client::Configuration] instance of Configuration class
      def configuration
        @configuration ||= Configuration.new
      end

      # @api public
      # Public: Allows to provide configuration values
      #
      # @return [Openai::Client::Configuration] instance of Configuration class
      #
      # Example:
      #  Openai::Client.configure do |c|
      #    c.logger          = Rails.logger
      #    c.access_token    = 'access_token_goes_here'
      #    c.organization_id = 'organization_id_goes_here'
      #    c.openai_url      = 'https://api.openai.com/v1'
      #  end
      def configure
        yield(configuration)
      end
    end
  end
end
