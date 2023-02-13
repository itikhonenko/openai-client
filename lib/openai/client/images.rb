# frozen_string_literal: true

require 'openai/client/utils'

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
        Http.new.multipart_post(EDIT_PATH, Utils.upload_io(body, %i[image mask], 'png')).body
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
        Http.new.multipart_post(VARIATION_PATH, Utils.upload_io(body, %i[image], 'png')).body
      rescue Faraday::Error
        nil
      end
    end
  end
end
