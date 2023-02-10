# frozen_string_literal: true

require 'support/shared_examples'

RSpec.describe Openai::Client::Http do
  let(:client) { described_class.new }
  let(:body) { {} }

  describe '#get' do
    subject(:request) { client.get(url) }

    include_examples 'API call'
  end

  describe '#post' do
    subject(:request) { client.post(url, body) }

    include_examples 'API call'
  end

  describe '#multipart_post' do
    subject(:request) { client.multipart_post(url, body) }

    let(:status) { 200 }

    include_examples 'API call'

    it 'sets the content type headers to multipart/form-data' do
      expect(request.env.request_headers['Content-Type']).to eq('multipart/form-data')
    end
  end
end
