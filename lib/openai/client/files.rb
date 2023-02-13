# frozen_string_literal: true

require 'openai/client/utils'

module Openai
  module Client
    class Files
      PATH = 'files'

      # @api public
      # Public: Makes an API call to return all files that belong to the user's organization.
      #
      # @return [Hash] a list of files
      def list
        Http.new.get(PATH).body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to upload a file.
      #
      # @param [Hash] body request body
      #
      # @return [Hash] the file
      def upload(body)
        Http.new.multipart_post(PATH, Utils.upload_io(body, %i[file], 'jsonl')).body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to delete the file.
      #
      # @param [String] id file ID
      #
      # @return [Hash] the file
      def delete(id)
        Http.new.delete("#{PATH}/#{id}").body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to find the file by the ID.
      #
      # @param [String] id file ID
      #
      # @return [Hash] found file or nil
      def find(id)
        Http.new.get("#{PATH}/#{id}").body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to find the contents of the specified file.
      #
      # @param [String] id file ID
      #
      # @return [Hash] the contents of the specified file or nil
      def find_content(id)
        Http.new.get("#{PATH}/#{id}/content").body
      rescue Faraday::Error
        nil
      end
    end
  end
end
