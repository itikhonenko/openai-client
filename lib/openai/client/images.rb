# frozen_string_literal: true

module Openai
  module Client
    class Images
      CREATE_PATH    = 'images/generations'
      EDIT_PATH      = 'images/edits'
      VARIATION_PATH = 'images/variations'

      # @api public
      # Public: Makes an API call to create an image given a prompt.
      #
      # @param [Hash] body request body
      #
      # @return [Hash] an image
      def create(body)
        Http.new.post(CREATE_PATH, body).body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to create an edited or extended image given an original image and a prompt.
      #
      # @param [Hash] body request body
      #
      # @return [Hash] an edited or extended image
      def edit(body)
        Http.new.multipart_post(EDIT_PATH, upload_io(body, %i[image mask])).body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to creates a variation of a given image.
      #
      # @param [Hash] body request body
      #
      # @return [Hash] a variation of a given image
      def variations(body)
        Http.new.multipart_post(VARIATION_PATH, upload_io(body, %i[image])).body
      rescue Faraday::Error
        nil
      end

      private

      # @api private
      # Internal: Creates the open IO object for the uploaded file.
      #
      # @param [Hash] data request body
      # @param [Array] param_names parameter names
      #
      # @return [Hash] request body
      def upload_io(data, param_names)
        param_names.each do |param|
          data[param] = Faraday::FilePart.new(data[param], 'rb') if data[param]
        end
        data
      end
    end
  end
end
