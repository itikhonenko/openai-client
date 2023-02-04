# frozen_string_literal: true

module Openai
  module Client
    class Models
      PATH = 'models'

      # @api public
      # Public: Makes an API call to return all models.
      #
      # @return [Hash] a hash with models
      def list
        Http.new.get(PATH).body
      rescue StandardError
        nil
      end

      # @api public
      # Public: Makes an API call to find the model by the ID.
      #
      # @param [String] id model id
      #
      # @return [Hash] found model or nil
      def find(id)
        Http.new.get("#{PATH}/#{id}").body
      rescue StandardError
        nil
      end
    end
  end
end
