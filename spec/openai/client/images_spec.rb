# frozen_string_literal: true

require 'support/shared_examples'

RSpec.describe Openai::Client::Images do
  describe '#create' do
    subject { described_class.new.create(request_body) }

    let(:request_body) do
      {
        prompt: 'A cute baby sea otter',
        n: 2,
        size: '1024x1024'
      }
    end
    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::CREATE_PATH}" }

    before do
      stub_request(:post, url).with({ body: request_body }).to_return(body: '{}', status: status)
    end

    it_behaves_like 'API wrapper'
  end

  describe '#edit' do
    subject { described_class.new.edit(request_body) }

    let(:image) { File.expand_path('spec/support/images/otter.png') }
    let(:request_body) do
      {
        image: image,
        mask: image,
        prompt: 'A cute baby sea otter wearing a beret',
        n: 2,
        size: '1024x1024'
      }
    end
    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::EDIT_PATH}" }

    before do
      stub_request(:post, url).to_return(body: '{}', status: status)
    end

    it_behaves_like 'API wrapper'
  end

  describe '#variations' do
    subject { described_class.new.variations(request_body) }

    let(:image) { File.expand_path('spec/support/images/otter.png') }
    let(:request_body) do
      {
        image: image,
        n: 2,
        size: '1024x1024'
      }
    end
    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::VARIATION_PATH}" }

    before do
      stub_request(:post, url).to_return(body: '{}', status: status)
    end

    it_behaves_like 'API wrapper'
  end
end
