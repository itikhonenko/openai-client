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

module Openai
  module Client
    extend Configurable

    ATTRS = ['models', 'edits', 'completions', 'images', 'embeddings', 'moderations'].freeze

    class << self
      ATTRS.each do |attr|
        define_method(attr) do
          instance_variable_get("@#{attr}") || instance_variable_set("@#{attr}",
                                                                     const_get(attr.capitalize, self).new)
        end
      end
    end
  end
end
