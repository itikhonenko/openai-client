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
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to find the model by the ID.
      #
      # @param [String] id model id
      #
      # @return [Hash] found model
      def find(id)
        Http.new.get("#{PATH}/#{id}").body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to delete a model.
      #
      # @param [String] id model id
      #
      # @return [Hash] the model
      def delete(id)
        Http.new.delete("#{PATH}/#{id}").body
      rescue Faraday::Error
        nil
      end
    end
  end
end
