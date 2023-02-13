# frozen_string_literal: true

module Openai
  module Client
    class FineTunes
      PATH = 'fine-tunes'

      # @api public
      # Public: Makes an API call to return list the organization's fine-tuning jobs.
      #
      # @return [Hash] a list of fine-tuning jobs
      def list
        Http.new.get(PATH).body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to find info about the fine-tune job.
      #
      # @param [String] id the ID of the fine-tune job
      #
      # @return [Hash] found fine-tune info
      def find(id)
        Http.new.get("#{PATH}/#{id}").body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to find fine-grained status updates for a fine-tune job.
      #
      # @param [String] id the ID of the fine-tune job
      #
      # @return [Hash] found fine-grained status updates
      def find_events(id)
        Http.new.get("#{PATH}/#{id}/events").body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to cancel a fine-tune job.
      #
      # @param [String] id the ID of the fine-tune job
      #
      # @return [Hash] the fine-tune related info
      def cancel(id)
        Http.new.post("#{PATH}/#{id}/cancel").body
      rescue Faraday::Error
        nil
      end

      # @api public
      # Public: Makes an API call to create a job that fine-tunes a specified model from a given dataset.
      #
      # @param [Hash] body request body
      #
      # @return [Hash] details of the enqueued job including job status and the name of the fine-tuned models
      def create(body)
        Http.new.post(PATH, body).body
      rescue Faraday::Error
        nil
      end
    end
  end
end
