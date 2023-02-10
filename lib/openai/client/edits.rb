# frozen_string_literal: true

module Openai
  module Client
    class Edits
      PATH = 'edits'

      # @api public
      # Public: Makes an API call to create edit.
      #
      # @param [Hash] body request body
      #
      # @return [Hash] a hash with edit
      def create(body)
        Http.new.post(PATH, body).body
      rescue Faraday::Error
        nil
      end
    end
  end
end
