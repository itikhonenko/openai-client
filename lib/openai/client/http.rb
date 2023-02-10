# frozen_string_literal: true

module Openai
  module Client
    class Http
      def initialize
        @connection = Faraday.new(url: Openai::Client.configuration.openai_url, headers: headers) do |conn|
          conn.response :json
          conn.response :raise_error
          conn.request :json
          conn.request :multipart
        end
        @logger = Openai::Client.configuration.logger
      end

      # @api public
      # Public: Makes a GET request using the Faraday HTTP Client.
      #
      # @param [String] path API path
      # @param [String] query_params query params
      #
      # @raise [Faraday::Error] on failure API call
      #
      # @return [Faraday::Response] instance of Faraday::Response class
      def get(path, query_params = {})
        connection.get(path, query_params)
      rescue Faraday::Error => e
        log_error(e) && raise
      end

      # @api public
      # Public: Makes a POST request using the Faraday HTTP Client.
      #
      # @param [String] path API path
      # @param [Hash] body request body
      #
      # @raise [Faraday::Error] on failure API call
      #
      # @return [Faraday::Response] instance of Faraday::Response class
      def post(path, body = {})
        connection.post(path, body)
      rescue Faraday::Error => e
        log_error(e) && raise
      end

      # @api public
      # Public: Makes a multipart request using the Faraday HTTP Client.
      #
      # @param [String] path API path
      # @param [Hash] body request body
      #
      # @raise [Faraday::Error] on failure API call
      #
      # @return [Faraday::Response] instance of Faraday::Response class
      def multipart_post(path, body = {})
        connection.post(path, body) do |request|
          request.headers['Content-Type'] = 'multipart/form-data'
          request.options.timeout = 300
        end
      rescue Faraday::Error => e
        log_error(e) && raise
      end

      private

      attr_reader :connection, :logger

      # @api private
      # Internal: Logs failure API calls.
      #
      # @param [Faraday::Error] e the error to log
      def log_error(e)
        logger.error("Error response, status: #{e.response[:status]}, body: #{e.response[:body]}")
      end

      def headers
        {
          'Authorization' => "Bearer #{Openai::Client.configuration.access_token}",
          'OpenAI-Organization' => Openai::Client.configuration.organization_id
        }
      end
    end
  end
end
