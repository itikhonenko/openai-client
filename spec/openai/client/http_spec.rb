# frozen_string_literal: true

RSpec.describe Openai::Client::Http do
  let(:client) { described_class.new }
  let(:url) { Faker::Internet.url }
  let(:logger) { Openai::Client.configuration.logger }
  let(:body) { {} }
  let(:error_message) { "Error response, status: #{status}, body: #{body}" }

  describe '#get' do
    subject(:get) { client.get(url) }

    before do
      stub_request(:get, url).to_return(body: body.to_s, status: status)
    end

    context 'when the API call is successful' do
      let(:status) { 200 }

      it 'handles a successful API call' do
        expect(get).to be_success
      end

      it 'parses response body into a hash' do
        expect(get.body).to be_a(Hash)
      end
    end

    context 'when the API call fails' do
      let(:status) { 500 }

      it 'raises an exception' do
        expect { get }.to raise_error(Faraday::Error)
      end

      it 'logs an error' do
        allow(logger).to receive(:error)

        get

        expect(logger).to have_received(:error).with(error_message)
      end
    end
  end

  describe '#post' do
    subject(:post) { client.post(url, body) }

    before do
      stub_request(:post, url).to_return(body: body.to_s, status: status)
    end

    context 'when the API call is successful' do
      let(:status) { 201 }

      it 'handles a successful API call' do
        expect(post).to be_success
      end

      it 'parses response body into a hash' do
        expect(post.body).to be_a(Hash)
      end
    end

    context 'when the API call fails' do
      let(:status) { 500 }

      it 'raises an exception' do
        expect { post }.to raise_error(Faraday::Error)
      end

      it 'logs an error' do
        allow(logger).to receive(:error)

        post

        expect(logger).to have_received(:error).with(error_message)
      end
    end
  end

  describe '#multipart_post' do
    subject(:multipart_post) { client.multipart_post(url, body) }

    before do
      stub_request(:post, url).to_return(body: body.to_s, status: status)
    end

    context 'when the API call is successful' do
      let(:status) { 201 }

      it 'handles a successful API call' do
        expect(multipart_post).to be_success
      end

      it 'parses response body into a hash' do
        expect(multipart_post.body).to be_a(Hash)
      end

      it 'sets the content type headers to multipart/form-data' do
        expect(multipart_post.env.request_headers['Content-Type']).to eq('multipart/form-data')
      end
    end

    context 'when the API call fails' do
      let(:status) { 500 }

      it 'raises an exception' do
        expect { multipart_post }.to raise_error(Faraday::Error)
      end

      it 'logs an error' do
        allow(logger).to receive(:error)

        multipart_post

        expect(logger).to have_received(:error).with(error_message)
      end
    end
  end
end
