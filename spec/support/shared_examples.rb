# frozen_string_literal: true

RSpec.shared_examples 'API wrapper' do
  let(:body) { '{}' }

  before do
    stub_request(:get, url).to_return(body: body, status: status)
  end

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
