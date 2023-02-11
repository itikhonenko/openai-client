# frozen_string_literal: true

module Openai
  module Client
    class Moderations
      PATH = 'moderations'

      # @api public
      # Public: Makes an API call to create a moderation.
      #
      # @param [Hash] body request body
      #
      # @return [Hash] a moderation
      def create(body)
        Http.new.post(PATH, body).body
      rescue Faraday::Error
        nil
      end
    end
  end
end
