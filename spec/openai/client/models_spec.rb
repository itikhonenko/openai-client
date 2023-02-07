# frozen_string_literal: true

require 'support/shared_examples'

RSpec.describe Openai::Client::Models do
  before do
    stub_request(:get, url).to_return(body: '{}', status: status)
  end

  describe '#find' do
    subject { described_class.new.find(model_id) }

    let(:model_id) { Faker::Number.digit }
    let(:url)      { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}/#{model_id}" }

    it_behaves_like 'API wrapper'
  end

  describe '#list' do
    subject { described_class.new.list }

    let(:url) { "#{Openai::Client.configuration.openai_url}/#{described_class::PATH}" }

    it_behaves_like 'API wrapper'
  end
end
