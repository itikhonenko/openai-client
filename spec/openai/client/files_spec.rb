# frozen_string_literal: true

require 'support/shared_examples'

RSpec.describe Openai::Client::Files do
  describe '#upload' do
    subject { described_class.new.upload(request_body) }

    let(:file) { File.expand_path('spec/support/jsonl/file.jsonl') }
    let(:request_body) do
      {
        file: file,
        purpose: 'fine-tune'
      }
    end
    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}" }

    it_behaves_like 'API wrapper'
  end

  describe '#find' do
    subject { described_class.new.find(file_id) }

    let(:file_id) { Faker::Number.digit }
    let(:url)     { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}/#{file_id}" }

    it_behaves_like 'API wrapper'
  end

  describe '#find_content' do
    subject { described_class.new.find_content(file_id) }

    let(:file_id) { Faker::Number.digit }
    let(:url)     { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}/#{file_id}/content" }

    it_behaves_like 'API wrapper'
  end

  describe '#delete' do
    subject { described_class.new.delete(file_id) }

    let(:file_id) { Faker::Number.digit }
    let(:url)     { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}/#{file_id}" }

    it_behaves_like 'API wrapper'
  end

  describe '#list' do
    subject { described_class.new.list }

    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}" }

    it_behaves_like 'API wrapper'
  end
end
