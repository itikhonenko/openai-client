# frozen_string_literal: true

module Openai
  module Client
    class Completions
      PATH = 'completions'

      # @api public
      # Public: Makes an API call to create a completion.
      #
      # @param [Hash] body request body
      #
      # @return [Hash] a hash with a completion
      def create(body)
        Http.new.post(PATH, body).body
      rescue StandardError
        nil
      end
    end
  end
end
