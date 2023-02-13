# frozen_string_literal: true

require 'support/shared_examples'

RSpec.describe Openai::Client::Embeddings do
  describe '#create' do
    subject { described_class.new.create(request_body) }

    let(:request_body) do
      {
        model: 'text-embedding-ada-002',
        input: 'The food was delicious and the waiter...'
      }
    end
    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}" }

    it_behaves_like 'API wrapper'
  end
end
