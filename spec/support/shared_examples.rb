# frozen_string_literal: true

RSpec.shared_examples 'API wrapper' do
  context 'when the API call is successful' do
    let(:status) { 200 }

    it 'returns a value' do
      expect(subject).not_to be_nil
    end
  end

  context 'when the API call fails' do
    let(:status) { 500 }

    it 'returns nil' do
      expect(subject).to be_nil
    end
  end
end

RSpec.shared_examples 'API call' do
  let(:url)           { Faker::Internet.url }
  let(:logger)        { Openai::Client.configuration.logger }
  let(:error_message) { "Error response, status: #{status}, body: #{body}" }

  before do
    stub_request(:any, url).to_return(body: body.to_s, status: status)
  end

  context 'when the API call is successful' do
    let(:status) { 200 }

    it 'handles a successful API call' do
      expect(request).to be_success
    end

    it 'parses response body into a hash' do
      expect(request.body).to be_a(Hash)
    end
  end

  context 'when the API call fails' do
    let(:status) { 500 }

    it 'raises an exception' do
      expect { request }.to raise_error(Faraday::Error)
    end

    it 'logs an error' do
      allow(logger).to receive(:error)

      request

      expect(logger).to have_received(:error).with(error_message)
    end
  end
end
