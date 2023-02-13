# frozen_string_literal: true

module Openai
  module Client
    module Utils
      class << self
        # @api private
        # Internal: Creates the open IO object for the uploaded file.
        #
        # @param [Hash] data request body
        # @param [Array] param_names parameter names
        # @param [String] content_type content type of the file data
        #
        # @return [Hash] request body
        def upload_io(data, param_names, content_type)
          param_names.each do |param|
            data[param] = Faraday::FilePart.new(data[param], content_type) if data[param]
          end
          data
        end
      end
    end
  end
end
