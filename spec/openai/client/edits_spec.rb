# frozen_string_literal: true

require 'support/shared_examples'

RSpec.describe Openai::Client::Edits do
  describe '#create' do
    subject { described_class.new.create(request_body) }

    let(:request_body) do
      {
        model: 'text-davinci-edit-001',
        input: 'What day of the wek is it?',
        instruction: 'Fix the spelling mistakes'
      }
    end
    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}" }

    before do
      stub_request(:post, url).with({ body: request_body }).to_return(body: '{}', status: status)
    end

    it_behaves_like 'API wrapper'
  end
end
