# frozen_string_literal: true

RSpec.describe Openai::Client do
  it 'has a version number' do
    expect(Openai::Client::VERSION).not_to be nil
  end
end
