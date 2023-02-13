# frozen_string_literal: true

require 'support/shared_examples'

RSpec.describe Openai::Client::Completions do
  describe '#create' do
    subject { described_class.new.create(request_body) }

    let(:request_body) do
      {
        model: 'text-davinci-003',
        prompt: 'Say this is a test',
        max_tokens: 7,
        temperature: 0,
        top_p: 1,
        n: 1,
        stream: false,
        logprobs: nil,
        stop: "\n"
      }
    end
    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}" }

    it_behaves_like 'API wrapper'
  end
end
