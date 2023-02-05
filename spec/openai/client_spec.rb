# frozen_string_literal: true

RSpec.describe Openai::Client do
  it 'has a version number' do
    expect(Openai::Client::VERSION).not_to be_nil
  end

  describe '.configuration' do
    subject(:configuration) { described_class.configuration }

    let(:logger)          { instance_double(Logger) }
    let(:access_token)    { Faker::Internet.password }
    let(:organization_id) { Faker::Number.digit }
    let(:openai_url)      { Faker::Internet.url }

    before do
      described_class.configure do |c|
        c.access_token    = access_token
        c.organization_id = organization_id
        c.logger          = logger
        c.openai_url      = openai_url
      end
    end

    it 'returns the provided access_token' do
      expect(configuration.access_token).to eq(access_token)
    end

    it 'returns the provided logger' do
      expect(configuration.logger).to eq(logger)
    end

    it 'returns the provided organization_id' do
      expect(configuration.organization_id).to eq(organization_id)
    end

    it 'returns the provided openai_url' do
      expect(configuration.openai_url).to eq(openai_url)
    end
  end

  describe '.models' do
    subject(:models) { described_class.models }

    it 'returns an instance of the Models class' do
      expect(models).to be_instance_of(described_class::Models)
    end
  end
end
