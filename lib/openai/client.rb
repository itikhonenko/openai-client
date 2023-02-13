# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'logger'

require 'openai/client/version'
require 'openai/client/configuration'
require 'openai/client/configurable'
require 'openai/client/http'
require 'openai/client/models'
require 'openai/client/edits'
require 'openai/client/completions'
require 'openai/client/images'
require 'openai/client/embeddings'
require 'openai/client/moderations'
require 'openai/client/files'
require 'openai/client/fine_tunes'

module Openai
  module Client
    extend Configurable

    ATTRS = [
      'models',
      'edits',
      'completions',
      'images',
      'embeddings',
      'moderations',
      'files',
      'fine_tunes'
    ].freeze

    class << self
      ATTRS.each do |attr|
        define_method(attr) do
          klass = const_get(attr.split('_').map(&:capitalize).join, self)
          instance_variable_get("@#{attr}") || instance_variable_set("@#{attr}", klass.new)
        end
      end
    end
  end
end
