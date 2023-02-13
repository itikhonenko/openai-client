# frozen_string_literal: true

require 'support/shared_examples'

RSpec.describe Openai::Client::FineTunes do
  describe '#create' do
    subject { described_class.new.create(request_body) }

    let(:request_body) do
      {
        training_file: "file-#{Faker::Alphanumeric.alphanumeric}"
      }
    end
    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}" }

    it_behaves_like 'API wrapper'
  end

  describe '#find' do
    subject { described_class.new.find(fine_tune_id) }

    let(:fine_tune_id) { Faker::Number.digit }
    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}/#{fine_tune_id}" }

    it_behaves_like 'API wrapper'
  end

  describe '#find_events' do
    subject { described_class.new.find_events(fine_tune_id) }

    let(:fine_tune_id) { Faker::Number.digit }
    let(:url)          { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}/#{fine_tune_id}/events" }

    it_behaves_like 'API wrapper'
  end

  describe '#cancel' do
    subject { described_class.new.cancel(fine_tune_id) }

    let(:fine_tune_id) { Faker::Number.digit }
    let(:url)          { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}/#{fine_tune_id}/cancel" }

    it_behaves_like 'API wrapper'
  end

  describe '#list' do
    subject { described_class.new.list }

    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}" }

    it_behaves_like 'API wrapper'
  end
end
