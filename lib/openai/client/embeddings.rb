# frozen_string_literal: true

module Openai
  module Client
    class Embeddings
      PATH = 'embeddings'

      # @api public
      # Public: Makes an API call to create an embedding.
      #
      # @param [Hash] body request body
      #
      # @return [Hash] an embedding
      def create(body)
        Http.new.post(PATH, body).body
      rescue Faraday::Error
        nil
      end
    end
  end
end
